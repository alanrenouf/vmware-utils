# vSphere Automation/VSAN Perl SDK DockerFile

Docker Image for running vSphere SDK for Perl 6.5, vSphere CLI 6.5, vSphere Automation SDK for Perl 6.5 & VSAN Management SDK for Perl 6.5

# Source

* https://my.vmware.com/group/vmware/details?downloadGroup=VS-PERL-SDK65&productId=614 (Includes vCLI)
* https://my.vmware.com/group/vmware/details?downloadGroup=VS-AUTOMATIONSDK-PERL65&productId=614
* https://my.vmware.com/group/vmware/get-download?downloadGroup=VSAN-MGMT-SDK65

# Build

```console
docker build -t perl-sdk .
```

# Run

```console
docker run --rm -it perl-sdk
```

# Usage
