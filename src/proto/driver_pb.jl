# syntax: proto3
using ProtoBuf
import ProtoBuf.meta
import ._ProtoBuf_Top_.matrix_io

mutable struct DriverConfig <: ProtoType
    delay_between_updates::Float32
    timeout_after_last_ping::Float32
    image::matrix_io.malos.v1.io.EverloopImage
    malos_eye_config::matrix_io.malos.v1.maloseye.MalosEyeConfig
    zigbee_message::matrix_io.malos.v1.comm.ZigBeeMsg
    lirc::matrix_io.malos.v1.comm.LircParams
    servo::matrix_io.malos.v1.io.ServoParams
    gpio::matrix_io.malos.v1.io.GpioParams
    humidity::matrix_io.malos.v1.sense.HumidityParams
    micarray::matrix_io.malos.v1.io.MicArrayParams
    zwave::matrix_io.malos.v1.comm.ZWaveMsg
    wakeword::matrix_io.malos.v1.io.WakeWordParams
    matrix_device::matrix_io.malos.v1.io.MatrixDeviceParams
    uuid::AbstractString
    DriverConfig(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct DriverConfig

mutable struct DriverInfo <: ProtoType
    driver_name::AbstractString
    base_port::Int32
    provides_updates::Bool
    delay_between_updates::Int32
    needs_pings::Bool
    timeout_after_last_ping::Int32
    notes_for_human::AbstractString
    DriverInfo(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct DriverInfo

mutable struct MalosDriverInfo <: ProtoType
    info::Base.Vector{DriverInfo}
    MalosDriverInfo(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct MalosDriverInfo

struct __enum_Status_MessageType <: ProtoEnum
    MESSAGE_TYPE_NOT_DEFINED::Int32
    STARTED::Int32
    STOPPED::Int32
    CONFIG_RECEIVED::Int32
    COMMAND_EXECUTED::Int32
    STATUS_CRITICAL::Int32
    STATUS_ERROR::Int32
    STATUS_WARNING::Int32
    STATUS_INFO::Int32
    STATUS_DEBUG::Int32
    __enum_Status_MessageType() = new(0,1,2,3,4,5,6,7,8,9)
end #struct __enum_Status_MessageType
const Status_MessageType = __enum_Status_MessageType()

mutable struct Status <: ProtoType
    _type::Int32
    uuid::AbstractString
    message::AbstractString
    Status(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Status

export DriverConfig, DriverInfo, MalosDriverInfo, Status_MessageType, Status
