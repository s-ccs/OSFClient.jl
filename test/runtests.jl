using OSFClient
using Test

node_id = "hk9g4"
@testset "OSFClient.jl" begin

    @testset "osf_api" begin
        o = osf_api(node_id)
        @test isa(o, Dict)

        o = osf_api(node_id, field="files")
        @test o["data"][1]["attributes"]["kind"] == "folder"


    end
    @testset "osf_traverse" begin
        t = osf_traverse(node_id)
        @test t.children[3].name == "folderA"
        @test t.children[3].children[1].children[2].value == "73aym"


    end
    @testset "osf_download" begin
        t = osf_traverse(node_id)
        ch = t.children[3].children[1].children[3]
        @test ch.value == "v7tze"
        # download text
        text = osf_download(ch.value) |> String
        @test text == "hey, you found me!"

        # download file
        @test osf_download(ch) |> String == text

        # download subtree
        subtree = osf_download(t.children[3].children[1])
        @test subtree.children[3].value |> String == text
        @testset "osf_download glob" begin
            #test glob
            glob_tree = osf_download(t; pattern=glob"*/*/*.txt")
            @test glob_tree.children[1].children[1].children[2].name == "exampleB.txt"
            @test typeof(glob_tree.children[1].children[1].children[2].value) == Vector{UInt8}

        end
    end

end

