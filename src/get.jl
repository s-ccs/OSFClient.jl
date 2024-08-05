"""
    osf_api(id;kwargs...)
    osf_api(url;kwargs...)

Make requests against the osf api. 

##args
id/url: osf-id, e.g. 3a7kt or url containing "https://api.osf.io/v2/[...]". In the latter case, URL is not modified, in the former case, `type` and `field` need to be specified

## kwargs
`field`: is put at `v2/*type*/id/*field*`
`type`: is put at `v2/*type*` - defaults to `nodes`
`parse`: if other than `json` returns the HTTP.get, else is converted to String and parsed with JSON.json

if `parse == "json"` (default), received data is put to string and parsed as json

"""
function osf_api(id_or_url; field="", type="nodes", kwargs...)

    if length(id_or_url) < 22 || id_or_url[1:22] != "https://api.osf.io/v2/"
        _osf_api("https://api.osf.io/v2/$type/$id_or_url/$field"; kwargs...)
    else
        _osf_api(id_or_url; kwargs...)
    end

end
function _osf_api(url; parse="json")
    #@info url
    d = url |> HTTP.get |> x -> x.body
    if parse == "json"
        return JSON.parse(String(d))
    else
        return d
    end
end



"""
    osf_download(t::FileTree, save_path::String; kwargs...) 
    
    osf_download(t::FileTree;
        save_path=nothing,
        pattern::Union{GlobMatch,Regex}=glob"*",
        return_downloads=isnothing(save_path))

    
Download all files in a FileTree that (optionally) match a glob or regex `pattern`. If `save_path` is specified, saves the requested files to that folder.

Returns a `FileTree` with the entries matching the pattern. Note that if `return_downloads` is false, the `children.values` will remain the `guid`/`id`'s of the osf and are not replaced with the content. This might change with a new version, where they might be replaced with a lazy loaded version linking to the `save_path` files.

If `return_downloads` is true, updates the values of the tree-entries with the respective downloaded bytes.

Content needs to still assigned, e.g. `String(t.value)` to convert a `Vector{UInt8}` to a string.
"""


osf_download(t::FileTree, save_path::String; kwargs...) = osf_download(t; save_path, kwargs...)
function osf_download(t::FileTree;
    save_path=nothing,
    pattern::Union{GlobMatch,Regex}=glob"*",
    return_downloads=isnothing(save_path))

    # add the save_path
    if !isnothing(save_path)
        t = FileTrees.rename(t, save_path)
    end

    # download the files
    t = map(t[pattern], dirs=false) do f
        dow = osf_download(f)
        #@debug subtree
        if !isnothing(save_path)
            if !isdir(dirname(path(f)))
                mkpath(dirname(path(f)))
            end
            write(path(f), dow)
        end
        if return_downloads
            return FileTrees.setvalue(f, dow)
        else
            return FileTrees.setvalue(f, f.value)
        end

    end
    return t
end

"""
    osf_download(t::FileTrees.File)
download a single file and return it
"""
osf_download(t::FileTrees.File) = osf_download(t.value)


"""
    osf_download(id::String)
download a single osf-id and return it
"""
function osf_download(id::String)
    return "https://osf.io/download/$id" |> HTTP.get |> x -> x.body
end

"""
    osf_download(t::FileTrees.File, save_path::String)
download a single file, write it to the save_path and return it
"""
function osf_download(id::String, save_path::String)
    out = "https://osf.io/download/$id" |> HTTP.get |> x -> x.body
    write(save_path, out)
    return out
end




