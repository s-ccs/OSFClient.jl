# Basic tutorial of functionality


Let's assume you have an OSF project
```@example main
using OsfClient
node_id = "hk9g4"
```

Let's get an overview of the available files
```@example main
tree = OsfClient.osf_traverse(node_id)
tree
```

One can easily download a subset of files:
```@example main
	f = osf_download(tree;pattern=glob"*/*/*.txt")
	f
```
and/or save them:
```@example main
	tdir = mktempdir()
	osf_download(tree,tdir;pattern=glob"*/*/*.txt")
```


You can also make a call to the api via:
```@example main
OsfClient.osf_api(node_id)
```

```@example main
OsfClient.osf_api(node_id;field="files")
```