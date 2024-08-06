var documenterSearchIndex = {"docs":
[{"location":"osf_basics/#Basic-tutorial-of-functionality","page":"Tutorial","title":"Basic tutorial of functionality","text":"","category":"section"},{"location":"osf_basics/","page":"Tutorial","title":"Tutorial","text":"Let's assume you have an OSF project","category":"page"},{"location":"osf_basics/","page":"Tutorial","title":"Tutorial","text":"using OSFClient\nnode_id = \"hk9g4\"","category":"page"},{"location":"osf_basics/","page":"Tutorial","title":"Tutorial","text":"Let's get an overview of the available files","category":"page"},{"location":"osf_basics/","page":"Tutorial","title":"Tutorial","text":"tree = osf_traverse(node_id)\ntree","category":"page"},{"location":"osf_basics/","page":"Tutorial","title":"Tutorial","text":"One can easily download a subset of files:","category":"page"},{"location":"osf_basics/","page":"Tutorial","title":"Tutorial","text":"\tf = osf_download(tree;pattern=glob\"*/*/*.txt\")\n\tf","category":"page"},{"location":"osf_basics/","page":"Tutorial","title":"Tutorial","text":"and/or save them:","category":"page"},{"location":"osf_basics/","page":"Tutorial","title":"Tutorial","text":"\ttdir = mktempdir()\n\tosf_download(tree,tdir;pattern=glob\"*/*/*.txt\")","category":"page"},{"location":"osf_basics/","page":"Tutorial","title":"Tutorial","text":"You can also make a call to the api via:","category":"page"},{"location":"osf_basics/","page":"Tutorial","title":"Tutorial","text":"osf_api(node_id)","category":"page"},{"location":"osf_basics/","page":"Tutorial","title":"Tutorial","text":"osf_api(node_id;field=\"files\")","category":"page"},{"location":"","page":"Home","title":"Home","text":"CurrentModule = OSFClient","category":"page"},{"location":"#OSFClient","page":"Home","title":"OSFClient","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for OSFClient.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [OSFClient]","category":"page"},{"location":"#OSFClient.get_attr-Tuple{Any}","page":"Home","title":"OSFClient.get_attr","text":"get_attr(data)\n\nreturns name, kind, id and folder (either name or materialized_path)\n\n\n\n\n\n","category":"method"},{"location":"#OSFClient.osf_api-Tuple{Any}","page":"Home","title":"OSFClient.osf_api","text":"osf_api(id;kwargs...)\nosf_api(url;kwargs...)\n\nMake requests against the osf api. \n\n##args id/url: osf-id, e.g. 3a7kt or url containing \"https://api.osf.io/v2/[...]\". In the latter case, URL is not modified, in the former case, type and field need to be specified\n\nkwargs\n\nfield: is put at v2/*type*/id/*field* type: is put at v2/*type* - defaults to nodes parse: if other than json returns the HTTP.get, else is converted to String and parsed with JSON.json\n\nif parse == \"json\" (default), received data is put to string and parsed as json\n\n\n\n\n\n","category":"method"},{"location":"#OSFClient.osf_download-Tuple{FileTrees.File}","page":"Home","title":"OSFClient.osf_download","text":"osf_download(t::FileTrees.File)\n\ndownload a single file and return it\n\n\n\n\n\n","category":"method"},{"location":"#OSFClient.osf_download-Tuple{String, String}","page":"Home","title":"OSFClient.osf_download","text":"osf_download(t::FileTrees.File, save_path::String)\n\ndownload a single file, write it to the save_path and return it\n\n\n\n\n\n","category":"method"},{"location":"#OSFClient.osf_download-Tuple{String}","page":"Home","title":"OSFClient.osf_download","text":"osf_download(id::String)\n\ndownload a single osf-id and return it\n\n\n\n\n\n","category":"method"},{"location":"#OSFClient.osf_traverse-Tuple{String}","page":"Home","title":"OSFClient.osf_traverse","text":"osf_traverse(nodeid)\n\nosftraverses all folders and copies information about the data. Recurrent function is called `osftraverse!`\n\n\n\n\n\n","category":"method"}]
}
