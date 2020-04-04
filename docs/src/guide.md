# Guide

## Installation
```julia
pkg> add https://github.com/Ilay101/MatrixCore
```

## Basic use
A structure is used to reach each specific driver:
- [`EverloopDriver`](@ref)
- [`GPIODriver`](@ref)
- [`HumidityDriver`](@ref)
- [`IMUDriver`](@ref)
- [`PressureDriver`](@ref)
- [`UVDriver`](@ref)

Each type has a single constructor taking the address of the raspberry
for parameter:
```julia
uvd=UVDriver("raspberry")

imud=IMUDriver("176.1.42.42")
```

The [`configure`](@ref) function is used to send configuration data to each driver.
The [`start`](@ref) function can be used to received data from the driver. Once enough data has been received, use [`close`](@ref) to close all sockets for the driver.

## Example
Use the code below to connect to the humidity driver and receive data every 2 seconds
```julia
julia> using MatrixCore
julia> h=HumidityDriver("raspberry")
julia> configure(h,2)
julia> start(h)
```
It is also possible to send data to the Everloop driver
```julia
h = EverloopDriver("raspberry")
for i=1:50
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
