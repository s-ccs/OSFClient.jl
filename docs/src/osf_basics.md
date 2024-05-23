# Basic tutorial of functionality

Let's assume you have an OSF project
```@example main
id = "hk9g4"
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
```