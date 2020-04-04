module MatrixCore

include("drivers.jl")

export Driver, HumidityDriver,
    IMUDriver, UVDriver, PressureDriver,
    GPIODriver, EverloopDriver,HumidityDriver,
    printmessage,
    connecterror, connectdata,
    connectkeepalive, configure,
    close, start

end # module
