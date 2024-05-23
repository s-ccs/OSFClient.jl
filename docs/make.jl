using OSFclient
using Documenter

DocMeta.setdocmeta!(OSFclient, :DocTestSetup, :(using OSFclient); recursive=true)

makedocs(;
    modules=[OSFclient],
    authors="Benedikt V. Ehinger",
    sitename="OSFclient.jl",
    format=Documenter.HTML(;
        canonical="https://s-ccs.github.io/OSFclient.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Tutorial" => "osf_basics.md"
    ],
)

deploydocs(;
    repo="github.com/s-ccs/OSFclient.jl",
    devbranch="main",
)
