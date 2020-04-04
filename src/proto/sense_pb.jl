# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct Dummy <: ProtoType
    value::Float32
    Dummy(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Dummy

mutable struct Humidity <: ProtoType
    humidity::Float32
    temperature::Float32
    temperature_raw::Float32
    temperature_is_calibrated::Bool
    Humidity(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Humidity

mutable struct HumidityParams <: ProtoType
    current_temperature::Float32
    HumidityParams(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct HumidityParams

mutable struct UV <: ProtoType
    uv_index::Float32
    oms_risk::AbstractString
    UV(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct UV

mutable struct Pressure <: ProtoType
    pressure::Float32
    altitude::Float32
    temperature::Float32
    Pressure(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Pressure

mutable struct Imu <: ProtoType
    yaw::Float32
    pitch::Float32
    roll::Float32
    accel_x::Float32
    accel_y::Float32
    accel_z::Float32
    gyro_x::Float32
    gyro_y::Float32
    gyro_z::Float32
    mag_x::Float32
    mag_y::Float32
    mag_z::Float32
    Imu(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Imu

export Dummy, Humidity, HumidityParams, UV, Pressure, Imu
