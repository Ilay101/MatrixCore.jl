using Documenter, MatrixCore

makedocs(;
    modules=[MatrixCore],
    repo="https://github.com/Ilay101/MatrixCore.jl/blob/{commit}{path}#L{line}",
    sitename="MatrixCore.jl",
    authors="Ilay Romaj",
    format=Documenter.HTML(
        assets=String[],
        ),
    pages=[
        "Home" => "index.md",
        "Guide" => "guide.md",
        "Reference" => "reference.md",
    ],
)

deploydocs(;
    repo="github.com/Ilay101/MatrixCore.jl",
    devbranch="master"
)
