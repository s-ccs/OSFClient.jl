# Deprecated
> [!CAUTION]
> I only lately got to known the much older and more versatile: [OpenScienceFramework.jl](https://github.com/JuliaAPlavin/OpenScienceFramework.jl) - this client here is deprecated and functionality will be moved to the other package.

# OSFClient
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://s-ccs.github.io/OSFClient.jl/dev/)
[![Build Status](https://github.com/s-ccs/OSFClient.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/s-ccs/OSFClient.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/s-ccs/OSFClient.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/s-ccs/OSFClient.jl)

## OSF Client 
A (as-of-right-now) read-only API-client for the open science framework at [OSF.io](https://osf.io/).

## Quickstart:
```julia
tdir = "/path/to/save/to/
node_id = "hk9g4"
osf_download(osf_traverse(node_id),tdir;pattern=glob"*/*/*.txt") # (optional pattern)
```
## Current Features
- Iterate through a public OSF project (via `iterate`) and get `FileTrees.jl` tree
- osf_download files via their `id` directly from OSF

## Missing features
This is really a barebone OSFClient, many things are missing:
- authentification
- upload files
- create or modify metadata/projects

## Contribution
You are very welcome to contribute to this, even total rewrites are not out of the question. Create an issue or a pull request directly. I'm also happy to hand over the project permanently. So far I only need the osf_download option anyway ;)
