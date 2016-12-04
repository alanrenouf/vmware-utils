# vSphere Automation/VSAN Python SDK DockerFile

Docker Image for running vSphere SDK for Python 6.5 (pyvmomi), vSphere Automation SDK for Python 6.5 & VSAN Management SDK for Python 6.5

# Source

* https://github.com/vmware/pyvmomi
* https://my.vmware.com/group/vmware/details?downloadGroup=VS-AUTOMATIONSDK-PYTHON65&productId=614
* https://my.vmware.com/group/vmware/get-download?downloadGroup=VSAN-MGMT-SDK65

# Build

```console
docker build -t python-sdk .
```

# Run

```console
docker run --rm -it python-sdk
```

# Usage

```console
/root/VMware-vSphere-Automation-SDK-Python-6.5.0/client/bin/run_sample.sh
```

```console
python /root/vsan-sdk-python/samplecode/vsanapisamples.py
```
