# MatrixCore

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://ilay.ulf.romaj@gmail.com.github.io/MatrixCore.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://ilay.ulf.romaj@gmail.com.github.io/MatrixCore.jl/dev)
[![Build Status](https://travis-ci.com/ilay.ulf.romaj@gmail.com/MatrixCore.jl.svg?branch=master)](https://travis-ci.com/ilay.ulf.romaj@gmail.com/MatrixCore.jl)
[![Codecov](https://codecov.io/gh/ilay.ulf.romaj@gmail.com/MatrixCore.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/ilay.ulf.romaj@gmail.com/MatrixCore.jl)

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
julia> configure(h,2)
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
red=zeros(UInt32,35)
configure(h,red,red,red)
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
