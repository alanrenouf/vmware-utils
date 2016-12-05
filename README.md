# vmware-utils DockerFile

Docker Image to deploy various VMware and open source related tools to manage a VMware environment

## Table of Contents

* [Why?](#why)
* [What?](#what)
* [How?](#how)
* [Build Container](#build-container)
* [Run Container](#run-container)

## Why

There are many reasons, sometimes you just need to quickly access a specific tool like a particular vSphere SDK or CLI and rather than having to deploy an OS or find one that is available, download the tool and then install it, you can easily spin up this Docker Container that already contains the latest version. This is also a fantastic swiss army knife that contains all of the popular VMware Utilities all in one place if you needed to ever troubleshoot an environment on the go and it includes some of the widely popular community code samples all downloaded for you.

## What

#### Uber Dockerfile

This Dockerfile will create a "Uber" Docker Container and install the following VMware tools:

* vSphere CLI 6.5
* govc 6.5
* PowerCLI Core 1.0
* vSphere Management SDK 6.5
* vSphere SDK for Perl 6.5
* vSphere SDK for Ruby (rbvmomi)
* vSphere SDK for Python (pyvmomi)
* vSphere SDK for Go (govmomi)
* vSphere Automation SDK for Ruby 6.5
* vSphere Automation SDK for Python 6.5
* vSphere Automation SDK for Perl 6.5
* vSphere Automation SDK for Java 6.5
* VSAN Management SDK for Ruby 6.5
* VSAN Management SDK for Python 6.5
* VSAN Management SDK for Java 6.5
* VSAN Management SDK for Perl 6.5
* Virtual Disk Development Kit (VDDK) 6.5
* OVFTool 4.2
* [PowerCLI Community Repository](https://github.com/lamw/PowerCLI-Example-Scripts/)
* [PowerCLI Core Docker Container Samples](https://github.com/lamw/powerclicore-docker-container-samples)
* [William Lam's vGhetto Script Repository](https://github.com/lamw/vghetto-scripts)
* [Pyvmomi Community Samples](https://github.com/lamw/pyvmomi-community-samples)
* Docker Client v1.12.3
* Docker Compose v1.8.1

#### Individual Dockerfiles

If you prefer specific SDK/CLI tools, there are also individual Dockerfile located in the directories below which contain their own README with instructions on how to build/use.

* [vsphere-automation-vsan-sdk-java-6.5](vsphere-automation-vsan-sdk-java-6.5) - vSphere SDK for Java, vSphere Automation SDK for Java & VSAN Management SDK for Java 6.5
* [vsphere-automation-vsan-sdk-perl-6.5](vsphere-automation-vsan-sdk-perl-6.5) - vSphere SDK for Perl, vSphere CLI, vSphere Automation SDK for Perl & VSAN Management SDK for Perl 6.5
* [vsphere-automation-vsan-sdk-python-6.5](vsphere-automation-vsan-sdk-python-6.5) - vSphere SDK for Python, vSphere Automation SDK for Python & VSAN Management Python for Java 6.5
* [vsphere-automation-vsan-sdk-ruby-6.5](vsphere-automation-vsan-sdk-ruby-6.5) - vSphere SDK for Ruby, vSphere Automation SDK for Ruby & VSAN Management SDK for Ruby 6.5
* [govc-6.5](govc-6.5) - vSphere SDK for Go and govc CLI 6.5
* [ovftool-4.2](ovftool-4.2)- OVFTool 4.2
* [vddk-6.5](vddk-6.5) - VDDK 6.5

## How

Before you can use the Docker Container, you will need to build it. First you need to manually download the following files from VMware's website (which you must register to do so):

1. Download vSphere SDK for Perl (which includes vCLI) 6.5 from: https://my.vmware.com/group/vmware/details?downloadGroup=VS-PERL-SDK65&productId=614
2. Download vSphere Management SDK 6.5 from: https://my.vmware.com/group/vmware/get-download?downloadGroup=VS-MGMT-SDK65
3. Download vSphere Automation SDK for Ruby 6.5 from: https://my.vmware.com/group/vmware/details?downloadGroup=VS-AUTOMATIONSDK-RUBY65&productId=614
4. Download vSphere Automation SDK for Python 6.5 from: https://my.vmware.com/group/vmware/details?downloadGroup=VS-AUTOMATIONSDK-PYTHON65&productId=614
5. Download vSphere Automation SDK for Perl 6.5 from: https://my.vmware.com/group/vmware/details?downloadGroup=VS-AUTOMATIONSDK-PERL65&productId=614
6. Download vSphere Automation SDK for Java 6.5 from: https://my.vmware.com/group/vmware/details?downloadGroup=VS-AUTOMATIONSDK-JAVA65&productId=614
7. Download VSAN Management SDK for Ruby 6.5 from: https://my.vmware.com/group/vmware/get-download?downloadGroup=VSAN-MGMT-SDK65
7. Download VSAN Management SDK for Python 6.5 from: https://my.vmware.com/group/vmware/get-download?downloadGroup=VSAN-MGMT-SDK65
7. Download VSAN Management SDK for Java 6.5 from: https://my.vmware.com/group/vmware/get-download?downloadGroup=VSAN-MGMT-SDK65
7. Download VSAN Management SDK for Perl 6.5 from: https://my.vmware.com/group/vmware/get-download?downloadGroup=VSAN-MGMT-SDK65
8. Download Virtual Disk Development Kit (VDDK) 6.5 from: https://my.vmware.com/group/vmware/details?downloadGroup=VDDK65&productId=614
9. Download OVFTool 4.2 from: https://my.vmware.com/group/vmware/details?downloadGroup=OVFTOOL420&productId=614

Next, you will need to create a new directory to store the 12 files you have just downloaded. In this example, I have just created a simple directory called "vmware-utils" and here is an example of the directory structure:

```
vmware-utils
├── Dockerfile
├── README.md
├── VMware-ovftool-4.2.0-4586971-lin.x86_64.bundle
├── VMware-vSphere-Automation-SDK-Java-6.5.0-4571808.zip
├── VMware-vSphere-Automation-SDK-Perl-6.5.0-4571819.zip
├── VMware-vSphere-Automation-SDK-Python-6.5.0-4571810.zip
├── VMware-vSphere-Automation-SDK-Ruby-6.5.0-4571906.zip
├── VMware-vSphere-CLI-6.5.0-4566394.x86_64.tar.gz
├── VMware-vSphereSDK-6.5.0-4571253.zip
├── VMware-vix-disklib-6.5.0-4604867.x86_64.tar.gz
├── vsan-sdk-65-java-4602587.zip
├── vsan-sdk-65-perl-4602587.zip
├── vsan-sdk-65-python-4602587.zip
└── vsan-sdk-65-ruby-4602587.zip
```

Now you are ready to build your container! For individual Docker Containers, please refer to their respective README for build details. 

## Build Uber Container

1. Change into the vmware-utils directory

2. Run the following command to build the Container and provide a tag for this particular build, an example would be lamw/vmware-utils

```console
$ docker build -t lamw/vmware-utils .
```

## Run Uber Container

Once the Container has been successfully built, you can run it using the following command:

```console
$ docker run --rm -it lamw/vmware-utils
```

At this point you are now logged into the Container that you have just built and you can see a few of the tools that have been installed

```console
root@5edc6aa7fead:~# ls
VDDK-6.5                            VMware-vSphere-Automation-SDK-Perl-6.5.0    VMware-vSphere-Automation-SDK-Ruby-6.5.0  vSphere-Management-SDK-6.5  vsan-sdk-perl    vsan-sdk-ruby
VMware-vSphere-Automation-SDK-Java  VMware-vSphere-Automation-SDK-Python-6.5.0  script-repos                              vsan-sdk-java               vsan-sdk-python
```
