using ZMQ
using ProtoBuf

include("./gen/matrix_io/matrix_io.jl")

"""
    Base type for Matrix Core drivers

# Fields
- baseport : base port for the driver
- host : host
- configsocket : ZMQ socket to send config data
- errsocket : ZMQ socket for receiving errors
- datasocket : ZMQ socket for receiving data
- keepalivesocket : ZMQ socket for sending keep alive pings
- datachannel : channel for receiving data as protobuf messages
- errchannel : channel for receiving error messages
"""
abstract type Driver end

"""
    Print the content of a message
"""
function printmessage(m)
    j = typeof(m)
    if typeof(m) == matrix_io.malos.v1.sense.Humidity
        println("Humidity $(m.humidity)% $(m.temperature)°C $(m.temperature_is_calibrated) $(m.temperature_raw)")
    elseif typeof(m) == matrix_io.malos.v1.sense.Pressure
        println("Pressure $(m.pressure) Pa $(m.altitude) m $(m.temperature) °C")
    elseif typeof(m) == matrix_io.malos.v1.sense.UV
        println("UV $(m.uv_index), $(m.oms_risk)")
    elseif typeof(m) == matrix_io.malos.v1.sense.Imu
        println("Imu $(m.yaw) ° $(m.pitch) ° $(m.roll) ° $(m.accel_x) m/s^2 $(m.accel_y) m/s^2 $(m.accel_z) m/s^2")
    elseif typeof(m) == matrix_io.malos.v1.io.EverloopImage
        println("Everloop $(m.everloop_length)")
    elseif typeof(m) == matrix_io.malos.v1.io.GpioParams
        println("GPIO $(m.values)")
    end
end

"""
    close(::<Driver)

Close all the sockets and channels of the driver
"""
function Base.close(d::T) where {T<:Driver}
    close(d.errsocket)
    close(d.datasocket)
    close(d.keepalivesocket)
    close(d.configsocket)
    close(d.datachannel)
    close(d.errchannel)
end

"""
    connecterror(::<Driver)

Connect to the error port for the driver and start a task to put the received messages in the
error channel of the driver.
Used in the [`start`](@ref) function.

# Returns
The started task
"""
function connecterror(d::T) where {T<:Driver}
    port = d.baseport+2
    connect(d.errsocket,"tcp://$(d.host):$port")
    subscribe(d.errsocket,"")
    @async while isopen(d.errsocket)
                try
                    m = recv(d.errsocket, String)
                    put!(d.errchannel, m)
                catch e
                    if typeof(e)!=ZMQ.StateError &&
                        typeof(e)!=EODError
                        println("caught exception $e")
                    end
                end
            end
end # function

"""
    connectdata(::<Driver)

Open the data socket and start a task to receive data messages and put them in the data channel.
Used in the [`start`](@ref) function

# Returns
The started task
"""
function connectdata(d::T) where {T<:Driver}
    port = d.baseport+3
    connect(d.datasocket,"tcp://$(d.host):$port")
    subscribe(d.datasocket,"")
    @async while isopen(d.datasocket)
                try
                    m = recv(d.datasocket, String)
                    put!(d.datachannel, decodedata(d,m))
                catch e
                    if typeof(e)!=ZMQ.StateError &&
                        typeof(e)!=EODError
                        println("caught exception $e")
                    end
                end
            end
end # function

"""
    connectkeepalive(::<Driver)

Open the keep alive socket and start a task to send empty messages to the driver.
Used in the [`start`](@ref) function

# Arguments
- d : driver

# Returns
The started task

# Named arguments
- time : time interval in seconds between messages
"""
function connectkeepalive(d::T; time::Number = 2) where {T<:Driver}
    port = d.baseport+1
    connect(d.keepalivesocket,"tcp://$(d.host):$port")
    @async while isopen(d.keepalivesocket)
                send(d.keepalivesocket,"")
                sleep(time)
            end
end # function

"""
    start(<:Driver, datafunc::Function, errfunc::Function, katime::Number)

Start tasks to receive and process messages from the driver

# Arguments
- `driver` : The driver to use
- `datafunc` : The function to process the incoming data messages.
    Must take a ProtoBuf message as unique parameter. Default behavior is to print the
    received message
- `errfunc` : The function to process the incoming error messages.
    Must take a unique parameter. Default behavior is to print the error message
- `katime` : Time interval in seconds for the keep alive messages

# Returns
 tuple of started tasks (t1, t2, t3, t4, t5), with
- t1 : data reception task
- t2 : error reception task
- t3 : keep alive send task
- t4 : data processing task
- t5 : error processing task

# Example
```julia
h = HumidityDriver("192.168.42.1")
configure(h; delay=2)
(t1, t2, t3, t4, t5) = start(h)
```
```julia
h = EverloopDriver("192.168.42.1")
for i=1:200
    n::UInt32=256
    red=rand(UInt32,35).%n
    green=rand(UInt32,35).%n
    blue=rand(UInt32,35).%n
    configure(h,red,green,blue)
    sleep(0.1)
end
red=zeros(UInt32,35)
configure(h,red,red,red)
closedriver(h)
```
"""
function start(driver::T, datafunc::Function=printmessage, errfunc::Function=println, katime::Number=2) where {T<:Driver}
    t1=connectdata(driver)
    t2=connecterror(driver)
    t3=connectkeepalive(driver; time=katime)
    t4=Task( () -> begin
            while true
                m = take!(driver.datachannel)
                datafunc(m)
            end
        end )
    schedule(t4)
    t5=Task( () -> begin
            while true
                m = take!(driver.errchannel)
                errfunc(m)
            end
        end )
    schedule(t5)
    (t1, t2, t3, t4, t5)
end

"""
    configure(<:Driver)

Send configuration data to the driver. Each driver has its own method using a specific set of arguments.

# Methods
```julia
configure(d::HumidityDriver; delay=2, timeout= 6, temp=21)
configure(d::IMUDriver; delay=2, timeout=6)
configure(d::UVDriver; delay=2, timeout=6)
configure(d::PressureDriver; delay=2, timeout=6)
configure(d::EverloopDriver,red::Array{UInt32},green::Array{UInt32},blue::Array{UInt32};nbleds=35)
configure(d::GPIODriver; delay=2, timeout=6, pin=1, isinput=false, value=0)
```

# Arguments
- `d` : driver

# Named arguments
- `delay` : period in seconds for data refresh
- `timeout` : delay in seconds to stop sending data messages after last keep alive message
- `temp` : calibration temperature for the humidity sensor
- `red`,`green`,`blue` : color arrays for the everloop driver
- `nbleds` : number of leds for the everloop driver
"""
function configure(::T) where {T<:Driver}
    error("abstract method")
end

function decodedata(::T, ::AbstractString) where {T<:Driver}
    error("abstract method")
end

function readproto(io::IOBuffer, t::T) where {T}
    d=ProtoDecoder(io)
    decode(d, t)
end

function writeproto(io::IOBuffer, m)
    e=ProtoEncoder(io)
    encode(e, m)
end

function make_driver(delay=2, timeout=6)
    matrix_io.malos.v1.driver.DriverConfig(
        delay,
        timeout,
        nothing, # image
        nothing, # malos_eye_config
        nothing, # zigbee_message
        nothing, # lirc
        nothing, # servo
        nothing, # gpio
        nothing, # humidity
        nothing, # micarray
        nothing, # zwave
        nothing, # wakeword
        nothing, # matrix_device
        "" # uuid
    )
end

"""
    HumidityDriver <: Driver

Driver for the humidity sensor
"""
struct HumidityDriver <: Driver
    baseport
    host::String
    configsocket::Socket
    errsocket::Socket
    keepalivesocket::Socket
    datasocket::Socket
    datachannel::Channel
    errchannel::Channel
    function HumidityDriver(h)
        d=new(20017, h, Socket(PUSH), Socket(SUB), Socket(PUSH), Socket(SUB), Channel(typemax(Int)), Channel(Inf))
        connect(d.configsocket, "tcp://$(d.host):$(d.baseport)")
        d
    end
end

function configure(d::HumidityDriver; delay=2, timeout= 6, temp=21)
    config = matrix_io.malos.v1.driver.DriverConfig(
        delay,
        timeout,
        nothing, # image
        nothing, # malos_eye_config
        nothing, # zigbee_message
        nothing, # lirc
        nothing, # servo
        nothing, # gpio
        matrix_io.malos.v1.sense.HumidityParams(temp), # humidity
        nothing, # micarray
        nothing, # zwave
        nothing, # wakeword
        nothing, # matrix_device
        "" # uuid
    )
    io = IOBuffer()
    writeproto(io, config)
    msg = String(take!(io))
    send(d.configsocket,msg)
end

function decodedata(d::HumidityDriver, buffer::AbstractString)
    io = IOBuffer(buffer)
    readproto(io, matrix_io.malos.v1.sense.Humidity)
end

"""
    IMUDriver <: Driver

Driver for the IMU sensor
"""
struct IMUDriver <: Driver
    baseport
    host::String
    configsocket::Socket
    errsocket::Socket
    keepalivesocket::Socket
    datasocket::Socket
    datachannel::Channel
    errchannel::Channel
    function IMUDriver(h)
        d=new(20013, h, Socket(PUSH), Socket(SUB), Socket(PUSH), Socket(SUB), Channel(typemax(Int)), Channel(Inf))
        connect(d.configsocket, "tcp://$(d.host):$(d.baseport)")
        d
    end
end

function configure(d::IMUDriver; delay=2, timeout=6)
    config = make_driver(delay, timeout)
    io = IOBuffer()
    writeproto(io, config)
    msg = String(take!(io))
    send(d.configsocket,msg)
end

function decodedata(d::IMUDriver, buffer::AbstractString)
    io = IOBuffer(buffer)
    readproto(io, matrix_io.malos.v1.sense.Imu)
end

"""
    UVDriver <: Driver

Driver for the UV sensor
"""
struct UVDriver <: Driver
    baseport
    host::String
    configsocket::Socket
    errsocket::Socket
    keepalivesocket::Socket
    datasocket::Socket
    datachannel::Channel
    errchannel::Channel
    function UVDriver(h)
        d=new(20029, h, Socket(PUSH), Socket(SUB), Socket(PUSH), Socket(SUB), Channel(typemax(Int)), Channel(Inf))
        connect(d.configsocket, "tcp://$(d.host):$(d.baseport)")
        d
    end
end

function configure(d::UVDriver; delay=2, timeout=6)
    config = make_driver(delay, timeout)
    io = IOBuffer()
    writeproto(io, config)
    msg = String(take!(io))
    send(d.configsocket,msg)
end

function decodedata(d::UVDriver, buffer::AbstractString)
    io = IOBuffer(buffer)
    readproto(io, matrix_io.malos.v1.sense.UV)
end

"""
    PressureDriver <: Driver

Driver for the Pressure sensor
"""
struct PressureDriver <: Driver
    baseport
    host::String
    configsocket::Socket
    errsocket::Socket
    keepalivesocket::Socket
    datasocket::Socket
    datachannel::Channel
    errchannel::Channel
    function PressureDriver(h)
        d=new(20025, h, Socket(PUSH), Socket(SUB), Socket(PUSH), Socket(SUB), Channel(typemax(Int)), Channel(Inf))
        connect(d.configsocket, "tcp://$(d.host):$(d.baseport)")
        d
    end
end

function configure(d::PressureDriver; delay=2, timeout=6)
    config = make_driver(delay, timeout)
    io = IOBuffer()
    writeproto(io, config)
    msg = String(take!(io))
    send(d.configsocket,msg)
end

function decodedata(d::PressureDriver, buffer::AbstractString)
    io = IOBuffer(buffer)
    readproto(io, matrix_io.malos.v1.sense.Pressure)
end

"""
    EverloopDriver <: Driver

Driver for the Everloop
"""
struct EverloopDriver <: Driver
    baseport
    host::String
    configsocket::Socket
    errsocket::Socket
    keepalivesocket::Socket
    datasocket::Socket
    datachannel::Channel
    errchannel::Channel
    function EverloopDriver(h)
        d=new(20021, h, Socket(PUSH), Socket(SUB), Socket(PUSH), Socket(SUB), Channel(typemax(Int)), Channel(Inf))
        connect(d.configsocket, "tcp://$(d.host):$(d.baseport)")
        d
    end
end

function configure(d::EverloopDriver,r::Array{UInt32},g::Array{UInt32},b::Array{UInt32};nbleds=35)
    config = matrix_io.malos.v1.driver.DriverConfig(
        delay,
        timeout,
        matrix_io.malos.v1.io.EverloopImage(), # image
        nothing, # malos_eye_config
        nothing, # zigbee_message
        nothing, # lirc
        nothing, # servo
        nothing, # gpio
        nothing, # humidity
        nothing, # micarray
        nothing, # zwave
        nothing, # wakeword
        nothing, # matrix_device
        "" # uuid
    )
    nb=min(size(r,1),size(g,1),size(b,1),nbleds)
    config.image.led=Vector{matrix_io.malos.v1.io.LedValue}(undef,nbleds)
    z::UInt32=0
    for i=1:nb
        config.image.led[i]=matrix_io.malos.v1.io.LedValue(red=r[i],green=g[i],blue=b[i],white=z)
    end
    for i=nb+1:nbleds
        config.image.led[i]=matrix_io.malos.v1.io.LedValue(red=z,green=z,blue=z,white=z)
    end
    io = IOBuffer()
    writeproto(io, config)
    msg = String(take!(io))
    send(d.configsocket,msg)
end

function decodedata(d::EverloopDriver, buffer::String)
    io = IOBuffer(buffer)
    readproto(io, matrix_io.malos.v1.io.EverloopImage)
end

"""
    GPIODriver <: Driver

Driver for the GPIO
"""
struct GPIODriver <: Driver
    baseport
    host::String
    configsocket::Socket
    errsocket::Socket
    keepalivesocket::Socket
    datasocket::Socket
    datachannel::Channel
    errchannel::Channel
    function GPIODriver(h)
        d=new(20049, h, Socket(PUSH), Socket(SUB), Socket(PUSH), Socket(SUB), Channel(typemax(Int)), Channel(Inf))
        connect(d.configsocket, "tcp://$(d.host):$(d.baseport)")
        d
    end
end

function configure(d::GPIODriver; delay=2, timeout=6, pin=1, isinput=false, value=0)
    config = matrix_io.malos.v1.driver.DriverConfig(
        delay,
        timeout,
        nothing, # image
        nothing, # malos_eye_config
        nothing, # zigbee_message
        nothing, # lirc
        nothing, # servo
        matrix_io.malos.v1.io.GpioParams(pin, isinput ? 0 : 1, value), # gpio
        nothing, # humidity
        nothing, # micarray
        nothing, # zwave
        nothing, # wakeword
        nothing, # matrix_device
        "" # uuid
    )
    io = IOBuffer()
    writeproto(io, config)
    msg = String(take!(io))
    send(d.configsocket,msg)
end

function decodedata(d::GPIODriver, buffer::String)
    io = IOBuffer(buffer)
    readproto(io, matrix_io.malos.v1.io.GpioParams)
end
