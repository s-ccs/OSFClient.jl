using OSFClient
using Documenter

DocMeta.setdocmeta!(OSFClient, :DocTestSetup, :(using OSFClient); recursive=true)

makedocs(;
    modules=[OSFClient],
    authors="Benedikt V. Ehinger",
    sitename="OSFClient.jl",
    format=Documenter.HTML(;
        canonical="https://s-ccs.github.io/OSFClient.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Tutorial" => "osf_basics.md"
    ],
)

deploydocs(;
    repo="github.com/s-ccs/OSFClient.jl",
    devbranch="main",
)
