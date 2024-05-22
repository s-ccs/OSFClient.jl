"""
    traverse(nodeid)
traverses all folders and copies information about the data. Recurrent function is called `traverse!`
"""
function traverse(node_id)
    files = osf_api(node_id; field="files")["data"]
    name, kind = get_attr(files[1])
    str = ""
    if kind == "folder"
        store = osf_api(node_id; field="files/$name")

        strings = []
        traverse!(strings, store)
    else
        return
    end
    return first.(strings), DataFrame(last.(strings))
end

function traverse!(strings, store; prefix="")

    for s in store["data"]
        name, kind, id, folder = get_attr(s)

        # get string
        str = prefix * (kind == "folder" ? "┣📂" : "┣📜") * name

        push!(strings, str => (; id, name, folder, kind))

        # recurse if necessary
        if kind == "folder"

            fulllink = s["relationships"]["files"]["links"]["related"]["href"]
            s_new = osf_api(fulllink)

            traverse!(strings, s_new; prefix=prefix * "┃")
        end
    end
end

"""
    get_attr(data)

returns name, kind, id and folder (either name or materialized_path)
"""
function get_attr(data)
    name = data["attributes"]["name"]
    kind = data["attributes"]["kind"]

    folder = name
    id = ""
    try
        id = data["id"]
    catch
        id = data["attributes"]["id"]
    end
    try
        folder = data["attributes"]["materialized_path"]
    catch
    end
    return name, kind, id, folder
end

