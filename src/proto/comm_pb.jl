# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

struct __enum_ZigBeeMsg_ZigBeeCmdType <: ProtoEnum
    ZCL::Int32
    NETWORK_MGMT::Int32
    __enum_ZigBeeMsg_ZigBeeCmdType() = new(0,1)
end #struct __enum_ZigBeeMsg_ZigBeeCmdType
const ZigBeeMsg_ZigBeeCmdType = __enum_ZigBeeMsg_ZigBeeCmdType()

struct __enum_ZigBeeMsg_ZCLCmd_ZCLCmdType <: ProtoEnum
    ON_OFF::Int32
    LEVEL::Int32
    COLOR_CONTROL::Int32
    IDENTIFY::Int32
    __enum_ZigBeeMsg_ZCLCmd_ZCLCmdType() = new(0,1,2,3)
end #struct __enum_ZigBeeMsg_ZCLCmd_ZCLCmdType
const ZigBeeMsg_ZCLCmd_ZCLCmdType = __enum_ZigBeeMsg_ZCLCmd_ZCLCmdType()

struct __enum_ZigBeeMsg_ZCLCmd_OnOffCmd_ZCLOnOffCmdType <: ProtoEnum
    ON::Int32
    OFF::Int32
    TOGGLE::Int32
    __enum_ZigBeeMsg_ZCLCmd_OnOffCmd_ZCLOnOffCmdType() = new(0,1,2)
end #struct __enum_ZigBeeMsg_ZCLCmd_OnOffCmd_ZCLOnOffCmdType
const ZigBeeMsg_ZCLCmd_OnOffCmd_ZCLOnOffCmdType = __enum_ZigBeeMsg_ZCLCmd_OnOffCmd_ZCLOnOffCmdType()

mutable struct ZigBeeMsg_ZCLCmd_OnOffCmd <: ProtoType
    _type::Int32
    ZigBeeMsg_ZCLCmd_OnOffCmd(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZigBeeMsg_ZCLCmd_OnOffCmd

struct __enum_ZigBeeMsg_ZCLCmd_LevelCmd_ZCLLevelCmdType <: ProtoEnum
    MOVE_TO_LEVEL::Int32
    MOVE::Int32
    __enum_ZigBeeMsg_ZCLCmd_LevelCmd_ZCLLevelCmdType() = new(0,1)
end #struct __enum_ZigBeeMsg_ZCLCmd_LevelCmd_ZCLLevelCmdType
const ZigBeeMsg_ZCLCmd_LevelCmd_ZCLLevelCmdType = __enum_ZigBeeMsg_ZCLCmd_LevelCmd_ZCLLevelCmdType()

mutable struct ZigBeeMsg_ZCLCmd_LevelCmd_MoveToLevelCmdParams <: ProtoType
    level::UInt32
    transition_time::UInt32
    ZigBeeMsg_ZCLCmd_LevelCmd_MoveToLevelCmdParams(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZigBeeMsg_ZCLCmd_LevelCmd_MoveToLevelCmdParams

mutable struct ZigBeeMsg_ZCLCmd_LevelCmd_MoveCmdParams <: ProtoType
    mode::UInt32
    rate::UInt32
    ZigBeeMsg_ZCLCmd_LevelCmd_MoveCmdParams(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZigBeeMsg_ZCLCmd_LevelCmd_MoveCmdParams

mutable struct ZigBeeMsg_ZCLCmd_LevelCmd <: ProtoType
    _type::Int32
    move_to_level_params::ZigBeeMsg_ZCLCmd_LevelCmd_MoveToLevelCmdParams
    move_params::ZigBeeMsg_ZCLCmd_LevelCmd_MoveCmdParams
    ZigBeeMsg_ZCLCmd_LevelCmd(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZigBeeMsg_ZCLCmd_LevelCmd

struct __enum_ZigBeeMsg_ZCLCmd_ColorControlCmd_ZCLColorControlCmdType <: ProtoEnum
    MOVETOHUE::Int32
    MOVETOSAT::Int32
    MOVETOHUEANDSAT::Int32
    MOVETOCOLORTEMP::Int32
    __enum_ZigBeeMsg_ZCLCmd_ColorControlCmd_ZCLColorControlCmdType() = new(0,1,2,3)
end #struct __enum_ZigBeeMsg_ZCLCmd_ColorControlCmd_ZCLColorControlCmdType
const ZigBeeMsg_ZCLCmd_ColorControlCmd_ZCLColorControlCmdType = __enum_ZigBeeMsg_ZCLCmd_ColorControlCmd_ZCLColorControlCmdType()

struct __enum_ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToHueCmdParams_DirectionParam <: ProtoEnum
    SHORTEST_DISTANCE::Int32
    LONGEST_DISTANCE::Int32
    UP::Int32
    DOWN::Int32
    __enum_ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToHueCmdParams_DirectionParam() = new(0,1,2,3)
end #struct __enum_ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToHueCmdParams_DirectionParam
const ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToHueCmdParams_DirectionParam = __enum_ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToHueCmdParams_DirectionParam()

mutable struct ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToHueCmdParams <: ProtoType
    hue::UInt32
    direction::Int32
    transition_time::UInt32
    ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToHueCmdParams(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToHueCmdParams

mutable struct ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToSatCmdParams <: ProtoType
    saturation::UInt32
    transition_time::UInt32
    ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToSatCmdParams(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToSatCmdParams

mutable struct ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToHueAndSatCmdParams <: ProtoType
    hue::UInt32
    saturation::UInt32
    transition_time::UInt32
    ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToHueAndSatCmdParams(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToHueAndSatCmdParams

mutable struct ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToColorTempCmdParams <: ProtoType
    color_temperature::UInt32
    transition_time::UInt32
    ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToColorTempCmdParams(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToColorTempCmdParams

mutable struct ZigBeeMsg_ZCLCmd_ColorControlCmd <: ProtoType
    _type::Int32
    movetohue_params::ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToHueCmdParams
    movetosat_params::ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToSatCmdParams
    movetohueandsat_params::ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToHueAndSatCmdParams
    movetocolortemp_params::ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToColorTempCmdParams
    ZigBeeMsg_ZCLCmd_ColorControlCmd(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZigBeeMsg_ZCLCmd_ColorControlCmd

struct __enum_ZigBeeMsg_ZCLCmd_IdentifyCmd_ZCLIdentifyCmdType <: ProtoEnum
    IDENTIFY_ON::Int32
    IDENTIFY_OFF::Int32
    __enum_ZigBeeMsg_ZCLCmd_IdentifyCmd_ZCLIdentifyCmdType() = new(0,1)
end #struct __enum_ZigBeeMsg_ZCLCmd_IdentifyCmd_ZCLIdentifyCmdType
const ZigBeeMsg_ZCLCmd_IdentifyCmd_ZCLIdentifyCmdType = __enum_ZigBeeMsg_ZCLCmd_IdentifyCmd_ZCLIdentifyCmdType()

mutable struct ZigBeeMsg_ZCLCmd_IdentifyCmd_IdentifyOnCmdParams <: ProtoType
    endpoint::UInt32
    identify_time::UInt32
    ZigBeeMsg_ZCLCmd_IdentifyCmd_IdentifyOnCmdParams(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZigBeeMsg_ZCLCmd_IdentifyCmd_IdentifyOnCmdParams

mutable struct ZigBeeMsg_ZCLCmd_IdentifyCmd_IdentifyOffCmdParams <: ProtoType
    identify_time::UInt32
    ZigBeeMsg_ZCLCmd_IdentifyCmd_IdentifyOffCmdParams(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZigBeeMsg_ZCLCmd_IdentifyCmd_IdentifyOffCmdParams

mutable struct ZigBeeMsg_ZCLCmd_IdentifyCmd <: ProtoType
    _type::Int32
    identify_on_params::ZigBeeMsg_ZCLCmd_IdentifyCmd_IdentifyOnCmdParams
    identify_off_params::ZigBeeMsg_ZCLCmd_IdentifyCmd_IdentifyOffCmdParams
    ZigBeeMsg_ZCLCmd_IdentifyCmd(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZigBeeMsg_ZCLCmd_IdentifyCmd

mutable struct ZigBeeMsg_ZCLCmd <: ProtoType
    _type::Int32
    onoff_cmd::ZigBeeMsg_ZCLCmd_OnOffCmd
    level_cmd::ZigBeeMsg_ZCLCmd_LevelCmd
    colorcontrol_cmd::ZigBeeMsg_ZCLCmd_ColorControlCmd
    identify_cmd::ZigBeeMsg_ZCLCmd_IdentifyCmd
    node_id::UInt32
    endpoint_index::UInt32
    ZigBeeMsg_ZCLCmd(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZigBeeMsg_ZCLCmd

struct __enum_ZigBeeMsg_NetworkMgmtCmd_NetworkMgmtCmdTypes <: ProtoEnum
    CREATE_NWK::Int32
    LEAVE_NWK::Int32
    NODE_LEAVE_NWK::Int32
    PERMIT_JOIN::Int32
    DISCOVERY_INFO::Int32
    RESET_PROXY::Int32
    IS_PROXY_ACTIVE::Int32
    NETWORK_STATUS::Int32
    __enum_ZigBeeMsg_NetworkMgmtCmd_NetworkMgmtCmdTypes() = new(0,1,2,3,4,5,6,7)
end #struct __enum_ZigBeeMsg_NetworkMgmtCmd_NetworkMgmtCmdTypes
const ZigBeeMsg_NetworkMgmtCmd_NetworkMgmtCmdTypes = __enum_ZigBeeMsg_NetworkMgmtCmd_NetworkMgmtCmdTypes()

mutable struct ZigBeeMsg_NetworkMgmtCmd_PermitJoinParams <: ProtoType
    time::UInt32
    ZigBeeMsg_NetworkMgmtCmd_PermitJoinParams(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZigBeeMsg_NetworkMgmtCmd_PermitJoinParams

mutable struct ZigBeeMsg_NetworkMgmtCmd_NodeLeaveNetParams <: ProtoType
    node_id::UInt32
    ZigBeeMsg_NetworkMgmtCmd_NodeLeaveNetParams(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZigBeeMsg_NetworkMgmtCmd_NodeLeaveNetParams

struct __enum_ZigBeeMsg_NetworkMgmtCmd_ClusterDescription_ClusterInOutType <: ProtoEnum
    SERVER_IN::Int32
    CLIENT_OUT::Int32
    __enum_ZigBeeMsg_NetworkMgmtCmd_ClusterDescription_ClusterInOutType() = new(0,1)
end #struct __enum_ZigBeeMsg_NetworkMgmtCmd_ClusterDescription_ClusterInOutType
const ZigBeeMsg_NetworkMgmtCmd_ClusterDescription_ClusterInOutType = __enum_ZigBeeMsg_NetworkMgmtCmd_ClusterDescription_ClusterInOutType()

mutable struct ZigBeeMsg_NetworkMgmtCmd_ClusterDescription <: ProtoType
    _type::Int32
    cluster_id::UInt32
    ZigBeeMsg_NetworkMgmtCmd_ClusterDescription(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZigBeeMsg_NetworkMgmtCmd_ClusterDescription

mutable struct ZigBeeMsg_NetworkMgmtCmd_EndPointDescription <: ProtoType
    endpoint_index::UInt32
    profile_id::UInt32
    device_id::UInt32
    clusters::Base.Vector{ZigBeeMsg_NetworkMgmtCmd_ClusterDescription}
    ZigBeeMsg_NetworkMgmtCmd_EndPointDescription(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZigBeeMsg_NetworkMgmtCmd_EndPointDescription

mutable struct ZigBeeMsg_NetworkMgmtCmd_NodeDescription <: ProtoType
    node_id::UInt32
    eui64::UInt64
    endpoints::Base.Vector{ZigBeeMsg_NetworkMgmtCmd_EndPointDescription}
    ZigBeeMsg_NetworkMgmtCmd_NodeDescription(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZigBeeMsg_NetworkMgmtCmd_NodeDescription

struct __enum_ZigBeeMsg_NetworkMgmtCmd_NetworkStatus_Status <: ProtoEnum
    NO_NETWORK::Int32
    JOINING_NETWORK::Int32
    JOINED_NETWORK::Int32
    JOINED_NETWORK_NO_PARENT::Int32
    LEAVING_NETWORK::Int32
    __enum_ZigBeeMsg_NetworkMgmtCmd_NetworkStatus_Status() = new(0,1,2,3,4)
end #struct __enum_ZigBeeMsg_NetworkMgmtCmd_NetworkStatus_Status
const ZigBeeMsg_NetworkMgmtCmd_NetworkStatus_Status = __enum_ZigBeeMsg_NetworkMgmtCmd_NetworkStatus_Status()

mutable struct ZigBeeMsg_NetworkMgmtCmd_NetworkStatus <: ProtoType
    _type::Int32
    ZigBeeMsg_NetworkMgmtCmd_NetworkStatus(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZigBeeMsg_NetworkMgmtCmd_NetworkStatus

mutable struct ZigBeeMsg_NetworkMgmtCmd <: ProtoType
    _type::Int32
    permit_join_params::ZigBeeMsg_NetworkMgmtCmd_PermitJoinParams
    is_proxy_active::Bool
    node_leave_params::ZigBeeMsg_NetworkMgmtCmd_NodeLeaveNetParams
    node_info::ZigBeeMsg_NetworkMgmtCmd_NodeDescription
    connected_nodes::Base.Vector{ZigBeeMsg_NetworkMgmtCmd_NodeDescription}
    network_status::ZigBeeMsg_NetworkMgmtCmd_NetworkStatus
    ZigBeeMsg_NetworkMgmtCmd(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZigBeeMsg_NetworkMgmtCmd

mutable struct ZigBeeMsg <: ProtoType
    _type::Int32
    zcl_cmd::ZigBeeMsg_ZCLCmd
    network_mgmt_cmd::ZigBeeMsg_NetworkMgmtCmd
    ZigBeeMsg(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZigBeeMsg

struct __enum_ZWaveMsg_ZWaveOperations <: ProtoEnum
    UNDEF::Int32
    SEND::Int32
    ADDNODE::Int32
    REMOVENODE::Int32
    SETDEFAULT::Int32
    LIST::Int32
    __enum_ZWaveMsg_ZWaveOperations() = new(0,1,2,3,4,5)
end #struct __enum_ZWaveMsg_ZWaveOperations
const ZWaveMsg_ZWaveOperations = __enum_ZWaveMsg_ZWaveOperations()

mutable struct ZWaveMsg_ZWaveCommandInfo <: ProtoType
    cmd::Int32
    param::Base.Vector{AbstractString}
    ZWaveMsg_ZWaveCommandInfo(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZWaveMsg_ZWaveCommandInfo

mutable struct ZWaveMsg_ZWaveClassInfo <: ProtoType
    zwave_class::Int32
    command::Base.Vector{ZWaveMsg_ZWaveCommandInfo}
    ZWaveMsg_ZWaveClassInfo(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZWaveMsg_ZWaveClassInfo

mutable struct ZWaveMsg_ZWaveNode <: ProtoType
    service_name::AbstractString
    zwave_class::Base.Vector{ZWaveMsg_ZWaveClassInfo}
    ZWaveMsg_ZWaveNode(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZWaveMsg_ZWaveNode

mutable struct ZWaveMsg_ZWaveCommand <: ProtoType
    zwclass::Int32
    cmd::Int32
    params::Array{UInt8,1}
    ZWaveMsg_ZWaveCommand(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZWaveMsg_ZWaveCommand

mutable struct ZWaveMsg <: ProtoType
    operation::Int32
    service_to_send::AbstractString
    zwave_cmd::ZWaveMsg_ZWaveCommand
    node::Base.Vector{ZWaveMsg_ZWaveNode}
    result::Bool
    ZWaveMsg(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZWaveMsg

mutable struct LircParams <: ProtoType
    device::AbstractString
    command::AbstractString
    config::AbstractString
    LircParams(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct LircParams

export ZigBeeMsg_ZigBeeCmdType, ZigBeeMsg_ZCLCmd_ZCLCmdType, ZigBeeMsg_ZCLCmd_OnOffCmd_ZCLOnOffCmdType, ZigBeeMsg_ZCLCmd_OnOffCmd, ZigBeeMsg_ZCLCmd_LevelCmd_ZCLLevelCmdType, ZigBeeMsg_ZCLCmd_LevelCmd_MoveToLevelCmdParams, ZigBeeMsg_ZCLCmd_LevelCmd_MoveCmdParams, ZigBeeMsg_ZCLCmd_LevelCmd, ZigBeeMsg_ZCLCmd_ColorControlCmd_ZCLColorControlCmdType, ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToHueCmdParams_DirectionParam, ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToHueCmdParams, ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToSatCmdParams, ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToHueAndSatCmdParams, ZigBeeMsg_ZCLCmd_ColorControlCmd_MoveToColorTempCmdParams, ZigBeeMsg_ZCLCmd_ColorControlCmd, ZigBeeMsg_ZCLCmd_IdentifyCmd_ZCLIdentifyCmdType, ZigBeeMsg_ZCLCmd_IdentifyCmd_IdentifyOnCmdParams, ZigBeeMsg_ZCLCmd_IdentifyCmd_IdentifyOffCmdParams, ZigBeeMsg_ZCLCmd_IdentifyCmd, ZigBeeMsg_ZCLCmd, ZigBeeMsg_NetworkMgmtCmd_NetworkMgmtCmdTypes, ZigBeeMsg_NetworkMgmtCmd_PermitJoinParams, ZigBeeMsg_NetworkMgmtCmd_NodeLeaveNetParams, ZigBeeMsg_NetworkMgmtCmd_ClusterDescription_ClusterInOutType, ZigBeeMsg_NetworkMgmtCmd_ClusterDescription, ZigBeeMsg_NetworkMgmtCmd_EndPointDescription, ZigBeeMsg_NetworkMgmtCmd_NodeDescription, ZigBeeMsg_NetworkMgmtCmd_NetworkStatus_Status, ZigBeeMsg_NetworkMgmtCmd_NetworkStatus, ZigBeeMsg_NetworkMgmtCmd, ZigBeeMsg, ZWaveMsg_ZWaveOperations, ZWaveMsg_ZWaveCommandInfo, ZWaveMsg_ZWaveClassInfo, ZWaveMsg_ZWaveNode, ZWaveMsg_ZWaveCommand, ZWaveMsg, LircParams
