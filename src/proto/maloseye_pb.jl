# syntax: proto3
using ProtoBuf
import ProtoBuf.meta
import ._ProtoBuf_Top_.matrix_io

struct __enum_EnumMalosAction <: ProtoEnum
    MALOS_ACTION_NOT_DEFINED::Int32
    START_DETECTION::Int32
    STOP_DETECTION::Int32
    RESTART_DETECTION::Int32
    CAPTURE_PREVIEW::Int32
    START_STREAMING::Int32
    STOP_STREAMING::Int32
    __enum_EnumMalosAction() = new(0,1,2,3,4,5,6)
end #struct __enum_EnumMalosAction
const EnumMalosAction = __enum_EnumMalosAction()

struct __enum_EnumMalosEyeDetectionType <: ProtoEnum
    MALOS_DETECTION_TYPE_NOT_DEFINED::Int32
    STOP::Int32
    FACE::Int32
    FACE_DEMOGRAPHICS::Int32
    FACE_DESCRIPTOR::Int32
    HAND_THUMB_UP::Int32
    HAND_PALM::Int32
    HAND_PINCH::Int32
    HAND_FIST::Int32
    __enum_EnumMalosEyeDetectionType() = new(0,1,20,21,30,40,41,42,43)
end #struct __enum_EnumMalosEyeDetectionType
const EnumMalosEyeDetectionType = __enum_EnumMalosEyeDetectionType()

mutable struct CameraConfig <: ProtoType
    source::AbstractString
    camera_id::Int32
    width::Int32
    height::Int32
    CameraConfig(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CameraConfig
const __fnum_CameraConfig = Int[4,1,2,3]
meta(t::Type{CameraConfig}) = meta(t, ProtoBuf.DEF_REQ, __fnum_CameraConfig, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct DetectionServerConfig <: ProtoType
    detection_server_address::AbstractString
    detection_server_timeout::Int32
    DetectionServerConfig(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct DetectionServerConfig

mutable struct FaceConfig <: ProtoType
    models_path::AbstractString
    send_slow::Bool
    send_text_proto::Bool
    FaceConfig(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct FaceConfig

mutable struct MalosEyeConfig <: ProtoType
    camera_config::CameraConfig
    face_config::FaceConfig
    detection_server_config::DetectionServerConfig
    object_to_detect::Base.Vector{Int32}
    action::Int32
    models::Base.Vector{matrix_io.common.Entity}
    config::matrix_io.common.Entity
    MalosEyeConfig(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct MalosEyeConfig
const __fnum_MalosEyeConfig = Int[1,2,4,21,5,6,7]
const __pack_MalosEyeConfig = Symbol[:object_to_detect]
meta(t::Type{MalosEyeConfig}) = meta(t, ProtoBuf.DEF_REQ, __fnum_MalosEyeConfig, ProtoBuf.DEF_VAL, true, __pack_MalosEyeConfig, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

export EnumMalosAction, EnumMalosEyeDetectionType, MalosEyeConfig, CameraConfig, DetectionServerConfig, FaceConfig
