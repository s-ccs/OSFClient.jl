"""
    osf_api(id;kwargs...)
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