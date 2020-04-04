# syntax: proto3
using ProtoBuf
import ProtoBuf.meta
import ProtoBuf.google.protobuf

mutable struct Value_Size <: ProtoType
    width::Int64
    height::Int64
    Value_Size(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Value_Size

mutable struct ArrayValue <: ProtoType
    values::Base.Any
    ArrayValue(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ArrayValue (has cyclic type dependency)
const __ftype_ArrayValue = Dict(:values => "Base.Vector{Value}")
meta(t::Type{ArrayValue}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, __ftype_ArrayValue)

mutable struct Value <: ProtoType
    boolean_value::Bool
    integer_value::Int64
    double_value::Float64
    entity_value::Base.Any
    array_value::ArrayValue
    timestamp_value::ProtoBuf.google.protobuf.Timestamp
    string_value::AbstractString
    blob_value::Array{UInt8,1}
    size_value::Value_Size
    Value(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Value (has cyclic type dependency)
const __fnum_Value = Int[1,2,3,6,9,10,17,18,19]
const __ftype_Value = Dict(:entity_value => "Entity")
const __oneofs_Value = Int[1,1,1,1,1,1,1,1,1]
const __oneof_names_Value = [Symbol("value_type")]
meta(t::Type{Value}) = meta(t, ProtoBuf.DEF_REQ, __fnum_Value, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, __oneofs_Value, __oneof_names_Value, __ftype_Value)

mutable struct Entity_PropertiesEntry <: ProtoType
    key::AbstractString
    value::Value
    Entity_PropertiesEntry(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Entity_PropertiesEntry (mapentry) (has cyclic type dependency)

mutable struct Entity <: ProtoType
    properties::Base.Dict # map entry
    Entity(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Entity (has cyclic type dependency)
const __ftype_Entity = Dict(:properties => "Base.Dict{AbstractString,Value}")
meta(t::Type{Entity}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, __ftype_Entity)

export ArrayValue, Value_Size, Value, Entity_PropertiesEntry, Entity, ArrayValue, Value, Entity_PropertiesEntry, Entity
# mapentries: "Entity_PropertiesEntry" => ("AbstractString", "Value")
