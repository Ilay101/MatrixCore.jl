push!(LOAD_PATH,"../src/")

using Documenter, MatrixCore

makedocs(;
    modules=[MatrixCore],
    repo="https://github.com/Ilay101/MatrixCore.jl/blob/{commit}{path}#L{line}",
    sitename="MatrixCore.jl",
    authors="Ilay Romaj",
    #format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
        "Guide" => "guide.md",
        "Reference" => "reference.md",
    ],
    #assets=String[],
)

deploydocs(;
    repo="github.com/Ilay101/MatrixCore.jl",
)
