# Basic tutorial of functionality


Let's assume you have an OSF project
```@example main
using OSFclient
node_id = "hk9g4"
```

Let's get an overview of the available files
```@example main
str,df = OSFclient.traverse(node_id)
str
```

We also get a dataframe `df` with all the info to download files

```@example main
df
```

And download one folder
```@example main
	subset_to_download = df[df.kind .== "file" .&& contains.(df.folder,"folderA2"),:]
	d  =OSFclient.download(tempdir()*"/myfiles",subset_to_download)
    read(tempdir()*"/myfiles/"*subset_to_download.folder[1]) |> String
```

You can also make a call to the api via:
```@example main
OSFclient.osf_api(node_id)
```

```@example main
OSFclient.osf_api(node_id;field="files")
```