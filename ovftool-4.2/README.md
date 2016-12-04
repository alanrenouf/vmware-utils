# OVFTool DockerFile

Docker Image for running govc and govmomi (vSphere SDK for Go)

# Source

* https://my.vmware.com/group/vmware/details?downloadGroup=OVFTOOL420&productId=614

# Build

```console
docker build -t ovftool .
```

# Run

```console
docker run --rm -it ovftool
```

# Usage

```console
ovftool --help
```
