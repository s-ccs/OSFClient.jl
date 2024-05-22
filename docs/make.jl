using osfclient
using Documenter

DocMeta.setdocmeta!(osfclient, :DocTestSetup, :(using osfclient); recursive=true)

makedocs(;
    modules=[osfclient],
    authors="Benedikt V. Ehinger",
    sitename="osfclient.jl",
    format=Documenter.HTML(;
        canonical="https://behinger.github.io/osfclient.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/behinger/osfclient.jl",
    devbranch="main",
)
