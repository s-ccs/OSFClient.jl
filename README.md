# OsfClient
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://s-ccs.github.io/OsfClient.jl/dev/)
[![Build Status](https://github.com/s-ccs/OsfClient.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/s-ccs/OsfClient.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/s-ccs/OsfClient.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/s-ccs/OsfClient.jl)

## OSF Client 
A (as-of-right-now read-only) API-client for the open science framework at [OSF.io](https://osf.io/).

## Current Features
- Iterate through a public OSF project (via `iterate`) and get `FileTrees.jl` tree
- osf_download files via their `id` directly from OSF

## Missing features
This is really a barebone OsfClient, many things are missing:
- authentification
- upload files
- create or modify metadata/projects

## Contribution
You are very welcome to contribute to this, even total rewrites are not out of the question. Create an issue or a pull request directly. I'm also happy to hand over the project permanently. So far I only need the osf_download option anyway ;)
