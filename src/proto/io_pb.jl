# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

struct __enum_EnumMatrixDeviceType <: ProtoEnum
    UNDETECTED::Int32
    CREATOR::Int32
    VOICE::Int32
    __enum_EnumMatrixDeviceType() = new(0,1,2)
end #struct __enum_EnumMatrixDeviceType
const EnumMatrixDeviceType = __enum_EnumMatrixDeviceType()

mutable struct LedValue <: ProtoType
    red::UInt32
    green::UInt32
    blue::UInt32
    white::UInt32
    LedValue(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct LedValue

mutable struct EverloopImage <: ProtoType
    led::Base.Vector{LedValue}
    everloop_length::Int32
    EverloopImage(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct EverloopImage

mutable struct ServoParams <: ProtoType
    pin::UInt32
    angle::UInt32
    ServoParams(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ServoParams

struct __enum_GpioParams_EnumMode <: ProtoEnum
    INPUT::Int32
    OUTPUT::Int32
    __enum_GpioParams_EnumMode() = new(0,1)
end #struct __enum_GpioParams_EnumMode
const GpioParams_EnumMode = __enum_GpioParams_EnumMode()

mutable struct GpioParams <: ProtoType
    pin::UInt32
    mode::Int32
    value::UInt32
    values::UInt32
    GpioParams(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GpioParams

mutable struct MicArrayParams <: ProtoType
    gain::Int32
    azimutal_angle::Float32
    polar_angle::Float32
    radial_distance_mm::Float32
    sound_speed_mmseg::Float32
    sampling_frequency_hz::UInt32
    MicArrayParams(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct MicArrayParams

struct __enum_WakeWordParams_MicChannel <: ProtoEnum
    channel0::Int32
    channel1::Int32
    channel2::Int32
    channel3::Int32
    channel4::Int32
    channel5::Int32
    channel6::Int32
    channel7::Int32
    channel8::Int32
    __enum_WakeWordParams_MicChannel() = new(0,1,2,3,4,5,6,7,8)
end #struct __enum_WakeWordParams_MicChannel
const WakeWordParams_MicChannel = __enum_WakeWordParams_MicChannel()

mutable struct WakeWordParams <: ProtoType
    wake_word::AbstractString
    channel::Int32
    lm_path::AbstractString
    dic_path::AbstractString
    enable_verbose::Bool
    stop_recognition::Bool
    WakeWordParams(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct WakeWordParams

mutable struct MatrixDeviceParams <: ProtoType
    device_type::Int32
    MatrixDeviceParams(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct MatrixDeviceParams

export EnumMatrixDeviceType, LedValue, EverloopImage, ServoParams, GpioParams_EnumMode, GpioParams, MicArrayParams, WakeWordParams_MicChannel, WakeWordParams, MatrixDeviceParams
