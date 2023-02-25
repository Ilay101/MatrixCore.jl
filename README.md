# MatrixCore

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://github.com/Ilay101/MatrixCore.jl/latest)
[![Build Status](https://github.com/Ilay101/MatrixCore.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/Ilay101/MatrixCore.jl/actions/workflows/CI.yml?query=branch%3Amaster)

A julia interface to the [Matrix Core protocol](https://matrix-io.github.io/matrix-documentation/matrix-core/overview/).
Currently, only the following drivers are supported
- Everloop
- IMU
- Humidity
- Pressure
- GPIO

## Installation

```julia
pkg> add https://github.com/Ilay101/MatrixCore.jl
```

## Basic use
Use the code below to connect to the humidity driver and receive data every 2 seconds
```julia
julia> using MatrixCore
julia> h=HumidityDriver("raspberry")
julia> configure(h;delay=2)
julia> start(h) # start receiving data from the driver
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
zz=zeros(UInt32,35)
configure(h,zz,zz,zz)
close(h)
```

## Reference
Each driver can be reached using a specific composite type:
- GPIODriver
- EverloopDriver
- HumidityDriver
- IMUDriver
- PressureDriver
- UVDriver

Each type has a single constructor taking the address of the raspberry
for parameter:
```julia
uvd=UVDriver("raspberry")

imud=IMUDriver("176.1.42.42")
```
