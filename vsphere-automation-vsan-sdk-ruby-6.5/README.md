# vSphere Automation/VSAN Ruby SDK DockerFile

Docker Image for running vSphere SDK for Ruby 6.5 (rbvmomi), vSphere Automation SDK for Ruby 6.5 & VSAN Management SDK for Ruby 6.5

# Source

* https://github.com/vmware/rbvmomi
* https://my.vmware.com/group/vmware/details?downloadGroup=VS-AUTOMATIONSDK-RUBY65&productId=614
* https://my.vmware.com/group/vmware/get-download?downloadGroup=VSAN-MGMT-SDK65

# Build

```console
docker build -t ruby-sdk .
```

# Run

```console
docker run --rm -it ruby-sdk
```

# Usage

```console
VMware-vSphere-Automation-SDK-Ruby-6.5.0/client/samples/bin/run_sample
```

```console
ruby /root/vsan-sdk-ruby/samplecode/vsanapisamples.rb
```
