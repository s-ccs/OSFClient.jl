# osfclient

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://s-ccs.github.io/OSFclient.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://s-ccs.github.io/OSFclient.jl/dev/)
[![Build Status](https://github.com/s-ccs/OSFclient.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/s-ccs/OSFclient.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/s-ccs/OSFclient.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/s-ccs/OSFclient.jl)

## OSF Client 
A (right now read-only) API-client for the open science framework at OSF.io .

## Current Features
- Iterative through a public OSF project (via `iterate`) and get a string representation + dataframe
- download files via their `id` directly from OSF

## Missing features
This is really a barebone OSFclient, many things are missing:
- authentification
- upload anything
- create or modify metadata/projects

## Contribution
You are very welcome to contribute to this, even total rewrites are not out of the question. Create an issue or a pull request directly. I'm also happy to hand over the project permanently. So far I only need the download option anyway ;)
