# VDDK DockerFile

Docker Image for running Virtual Disk Development Kit (VDDK)

# Source

* https://my.vmware.com/group/vmware/details?downloadGroup=VDDK65&productId=614

# Build

```console
docker build -t vddk .
```

# Run

```console
docker run --rm -it vddk
```

# Usage

VDDK library is installed under /root/vmware-vix-disklib-distrib and you can access VDDK binary tools under /root/vmware-vix-disklib-distrib/bin64/

```console
/root/vmware-vix-disklib-distrib/bin64/vmware-vdiskmanager --help
```
