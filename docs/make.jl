using OsfClient
using Documenter

DocMeta.setdocmeta!(OsfClient, :DocTestSetup, :(using OsfClient); recursive=true)

makedocs(;
    modules=[OsfClient],
    authors="Benedikt V. Ehinger",
    sitename="OsfClient.jl",
    format=Documenter.HTML(;
        canonical="https://s-ccs.github.io/OsfClient.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Tutorial" => "osf_basics.md"
    ],
)

deploydocs(;
    repo="github.com/s-ccs/OsfClient.jl",
    devbranch="main",
)
