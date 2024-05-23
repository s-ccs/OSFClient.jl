"""
    osf_api(id;kwargs...)
using Base: isfieldatomic
    osf_api(url;kwargs...)
helper to make requests against the osf api. 

##args
id/url: osf-id, e.g. 3a7kt or url containing "https://api.osf.io/v2/"

## kwargs
`field`: is put at `v2/type/id/*field*`
`type`: is put at `v2/*type*`
`parse`: if other than `json` returns the HTTP.get, else is converted to String and parsed with JSON.json

if `parse == "json"` (default), received data is put to string and parsed as json

"""
function osf_api(id_or_url; field="", type="nodes", kwargs...)
    if length(id_or_url) < 22
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


function download(id)
    return "https://osf.io/download/$id" |> HTTP.get |> x -> x.body
end

function download(save_folder, df::DataFrame)
    download.(Ref(save_folder), eachrow(df))
end


"""
    download(id)
Download an OSF id, returns the body of HTTP.get

    download(save_folder,df::DataFrameRow)
    download(save_folder,df::DataFrame)

Downloads all `df.id`'s to their respective `save_folder * df.folder`.

## keywordargs
`overwrite` (Bool=false) - flag to overwrite already existing files.



"""
function download(save_folder, df::DataFrames.DataFrameRow; overwrite=false)
    target = save_folder * df.folder
    if isfile(target) && !overwrite
        @warn "$target already exists, put flag `overwrite=true` to re-download and overwrite"
        return
    end
    mkpath(splitdir(target)[1])
    write(target, download(df.id))
end