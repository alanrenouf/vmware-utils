# govc / govmomi DockerFile

Docker Image for running govc and govmomi (vSphere SDK for Go)

# Source

* https://github.com/vmware/govmomi
* https://github.com/vmware/govmomi/tree/master/govc

# Build

```console
docker build -t govc .
```

# Run

```console
docker run --rm -it govc
```

# Usage

Set GOVC_URL to credentials of an ESXi/vCenter Server and run simple "ls" command to list vSphere root inventory.

```console
export GOVC_URL='https://administrator@vghetto.local:VMware1!@192.168.1.51/sdk'
govc ls -k=true
```
