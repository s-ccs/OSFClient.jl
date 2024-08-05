"""
    osf_traverse(nodeid)
osf_traverses all folders and copies information about the data. Recurrent function is called `osf_traverse!`
"""
function osf_traverse(node_id::String)
    files = osf_api(node_id; field="files")["data"]
    name, kind = get_attr(files[1])
    t = []
    if kind == "folder"
        store = osf_api(node_id; field="files/$name")

        osf_traverse!(t, store)
    else
        return
    end
    return maketree(node_id => t)
end

function osf_traverse!(t, store)#; prefix="")

    for s in store["data"]
        name, kind, id, folder = get_attr(s)

        t_content = []
        # recurse if necessary
        if kind == "folder"

            fulllink = s["relationships"]["files"]["links"]["related"]["href"]
            s_new = osf_api(fulllink)

            osf_traverse!(t_content, s_new)# prefix=prefix * "┃")
            push!(t, name => t_content)
        else
            push!(t, (name=name, value=id))
        end
        #@debug folder, name, t_content

    end
end

"""
    get_attr(data)

returns name, kind, id and folder (either name or materialized_path)
"""
function get_attr(data)
    name = data["attributes"]["name"]
    kind = data["attributes"]["kind"]
    #@show data["attributes"] data["id"]
    folder = name
    id = ""
    try
        id = data["attributes"]["guid"]
    catch
        id = data["id"]

    end
    try
        folder = data["attributes"]["materialized_path"]
    catch
    end
    return name, kind, id, folder
end

