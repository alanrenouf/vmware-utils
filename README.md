# vmware-utils DockerFile

Docker Image to deploy various VMware and open source related tools to manage a VMware environment

## Table of Contents

* [Why?](#why)
* [What?](#what)
* [How?](#how)
* [Build Container](#build-container)
* [Run Container](#run-container)
 	* [Accessing vCLI Commands](#accessing-vcli-commands)
 	* [Accessing vGhetto Script Repository](#accessing-vghetto-script-repository)
 	* [Accessing OVF Tool](#accessing-ovf-tool)
 	* [Accessing RVC](#accessing-rvc)
 	* [Accessing vSphere Virtual Disk Manager](#accessing-vsphere-virtual-disk-manager)
 	* [Accessing govc](#accessing-govc)
 	* [Accessing vCloud Air CLI](#accessing-vcloud-air-cli)
 	* [Accessing vCloud Air RaaS](#accessing-vcloud-air-raas)

## Why

Most VMware Admins create their own box and modify the vMA so much that it becomes a problem when its time to upgrade to the latest version, this way they can easily build their own box and add their own scripts.

## What

This Dockerfile will create a Docker Container and install the following VMware tools:

* VMware vSphere vCLI
* VMware OVF Tool
* William Lam's vGhetto Script Repository
* vSphere SDK for Ruby (rbVmomi)
* vSphere SDK for Python (pyVmomi)
* vSphere SDK for Go (goVmomi)
* vSphere Ruby Console (RVC)
* vSphere Virtual Disk Manager (VDDK)
* vCloud Air CLI (vca-cli)
* vCloud Air Recovery as a Service CLI (RaaS)
* vCloud SDK for Python
* vCloud Tools
* vRealize Cloud Client

## How

To use this Dockerfile, you will first need to first download the following files from VMware's website (which you must register to do so)

1. Download the latest version of vSphere CLI for vSphere 5.5 from here: https://developercenter.vmware.com/web/dp/tool/vsphere_cli/5.5
2. Download the latest version of VMware OVF Tool for Linux 64-bit from here: https://my.vmware.com/web/vmware/details?downloadGroup=OVFTOOL400&productId=353
3. Download the latest version of vSphere Virtual DIska Manager for Linux 64-bit from here: https://my.vmware.com/web/vmware/details?downloadGroup=VDDK554&productId=353
4. Download the latest version of the vRealize Cloud Client from here: http://developercenter.vmware.com/web/dp/tool/cloudclient/3.2.0
5. Download / Clone the Dockerfile from this project

Next, you will need to create a new directory to store the five files you have just downloaded. In this example, I have just created a simple directory called "vmware-utils" and here is an example of the directory structure:

```
vmware-utils
├── Dockerfile
├── VMware-ovftool-4.0.0-2301625-lin.x86_64.bundle
├── VMware-vSphere-CLI-5.5.0-2043780.x86_64.tar.gz
├── VMware-vix-disklib-5.5.4-2454786.x86_64.tar.gz
└── cloudclient-3.3.1-2966416-dist.zip
```

Now you are ready to build your container!

## Build Container

1. Change into the vmware-utils directory

2. Run the following command to build the Container and provide a tag for this particular build, an example would be lamw/vmware-utils

```console
$ sudo docker build -t lamw/vmware-utils .
```

## Run Container

Once the Container has been sucessfully built, you can run it using the following command:

```console
$ sudo docker run --rm -it lamw/vmware-utils
```

At this point you are now logged into the Container that you have just built and you can see a few of the tools that have been installed

```console
root@9fcb6949d2c6:~# ls
cloudclient-3.1.3-2966416  pyvmomi  src  vghetto
```

## Accessing vCLI Commands

```console
root@9fcb6949d2c6:~# vicfg-
vicfg-advcfg      vicfg-dns         vicfg-ipsec       vicfg-mpath       vicfg-nics        vicfg-route       vicfg-syslog      vicfg-volume
vicfg-authconfig  vicfg-dumppart    vicfg-iscsi       vicfg-mpath35     vicfg-ntp         vicfg-scsidevs    vicfg-user        vicfg-vswitch
vicfg-cfgbackup   vicfg-hostops     vicfg-module      vicfg-nas         vicfg-rescan      vicfg-snmp        vicfg-vmknic
```

## Accessing vGhetto Script Repository

```console
root@9fcb6949d2c6:~# ls vghetto/
README.md  batch  other  perl  php  powershell  puppet  python  ruby  shell
```

## Accessing OVF Tool

```console
root@9fcb6949d2c6:~# ovftool
Error: No source or target specified. Try 'ovftool --help' for more options.
Completed with errors
```
## Accessing RVC

```console
root@9fcb6949d2c6:~# rvc --help
Install the "ffi" gem for better tab completion.
Ruby vSphere Console.

Usage:
       rvc [options] [username[:password]@]hostname

where [options] are:
  --path=<s>            Initial directory
  --create-directory    Create the initial directory if it doesn't exist
  -c, --cmd=<s>         command to evaluate
  -s, --script=<s>      file to execute
  --script-args=<s>     arguments to script (default: )
  -k, --cookie=<s>      authentication cookie file
  -q, --quiet           silence unnecessary output
  -v, --version         Print version and exit
  -h, --help            Show this message
```

## Accessing vSphere Virtual Disk Manager

```console
root@9fcb6949d2c6:~# vmware-vdiskmanager
VMware Virtual Disk Manager - build 2454786.
Usage: vmware-vdiskmanager OPTIONS <disk-name> | <mount-point>
Offline disk manipulation utility
  Operations, only one may be specified at a time:
     -c                   : create disk.  Additional creation options must
                            be specified.  Only local virtual disks can be
                            created.
     -d                   : defragment the specified virtual disk. Only
                            local virtual disks may be defragmented.
     -k                   : shrink the specified virtual disk. Only local
                            virtual disks may be shrunk.
     -n <source-disk>     : rename the specified virtual disk; need to
                            specify destination disk-name. Only local virtual
                            disks may be renamed.
     -p                   : prepare the mounted virtual disk specified by
                            the mount point for shrinking.
     -r <source-disk>     : convert the specified disk; need to specify
                            destination disk-type.  For local destination disks
                            the disk type must be specified.
     -x <new-capacity>    : expand the disk to the specified capacity. Only
                            local virtual disks may be expanded.
     -R                   : check a sparse virtual disk for consistency and attempt
                            to repair any errors.
     -e                   : check for disk chain consistency.
     -D                   : make disk deletable.  This should only be used on disks
                            that have been copied from another product.

  Other Options:
     -q                   : do not log messages

  Additional options for create and convert:
     -a <adapter>         : (for use with -c only) adapter type
                            (ide, buslogic, lsilogic). Pass lsilogic for other adapter types.
     -s <size>            : capacity of the virtual disk
     -t <disk-type>       : disk type id

  Options for remote disks:
     -h <hostname>        : hostname of remote server
     -u <username>        : username for remote server
     -f <filename>        : file containing password
     -P <port>            : optional TCP port number (default: 902)
     -S                   : specifies that the source disk is remote, by default
                            the remote options are assumed to refer to the
                            destination.
  Disk types:
      0                   : single growable virtual disk
      1                   : growable virtual disk split in 2GB files
      2                   : preallocated virtual disk
      3                   : preallocated virtual disk split in 2GB files
      4                   : preallocated ESX-type virtual disk
      5                   : compressed disk optimized for streaming
      6                   : thin provisioned virtual disk - ESX 3.x and above

     The capacity can be specified in sectors, KB, MB or GB.
     The acceptable ranges:
                           ide adapter : [1MB, 2040.0GB]
                           scsi adapter: [1MB, 2040.0GB]
        ex 1: vmware-vdiskmanager -c -s 850MB -a ide -t 0 myIdeDisk.vmdk
        ex 2: vmware-vdiskmanager -d myDisk.vmdk
        ex 3: vmware-vdiskmanager -r sourceDisk.vmdk -t 0 destinationDisk.vmdk
        ex 4: vmware-vdiskmanager -x 36GB myDisk.vmdk
        ex 5: vmware-vdiskmanager -n sourceName.vmdk destinationName.vmdk
        ex 6: vmware-vdiskmanager -r sourceDisk.vmdk -t 4 -h esx-name.mycompany.com \
              -u username -f passwordfile "[storage1]/path/to/targetDisk.vmdk"
        ex 7: vmware-vdiskmanager -k myDisk.vmdk
        ex 8: vmware-vdiskmanager -p <mount-point>
              (A virtual disk first needs to be mounted at <mount-point>)
```

## Accessing govc

```console
root@9fcb6949d2c6:~# govc --help
Usage of govc:
  about
  datacenter.create
  datacenter.destroy
  datastore.cp
  datastore.download
  datastore.ls
  datastore.mkdir
  datastore.mv
  datastore.rm
  datastore.upload
  device.boot
  device.cdrom.add
  device.cdrom.eject
  device.cdrom.insert
  device.connect
  device.disconnect
  device.floppy.add
  device.floppy.eject
  device.floppy.insert
  device.info
  device.ls
  device.remove
  device.scsi.add
  device.serial.add
  device.serial.connect
  device.serial.disconnect
  guest.chmod
  guest.download
  guest.getenv
  guest.kill
  guest.ls
  guest.mkdir
  guest.mktemp
  guest.ps
  guest.rm
  guest.rmdir
  guest.start
  guest.upload
  host.esxcli
  host.info
  host.portgroup.add
  host.portgroup.remove
  host.vswitch.add
  host.vswitch.info
  host.vswitch.remove
  import.ova
  import.ovf
  import.vmdk
  license.add
  license.list
  license.remove
  ls
  pool.change
  pool.create
  pool.destroy
  pool.info
  version
  vm.change
  vm.create
  vm.destroy
  vm.disk.attach
  vm.disk.create
  vm.info
  vm.ip
  vm.network.add
  vm.network.change
  vm.power
  vm.question
  vm.vnc
```

## Accessing vCloud Air CLI

```console
root@9fcb6949d2c6:~# vca
Usage: vca [OPTIONS] COMMAND [ARGS]...

  VMware vCloud Air Command Line Interface.

Options:
  -p, --profile <profile>  Profile id
  -v, --version            Show version
  -d, --debug              Enable debug
  -j, --json               Results as JSON object
  -x, --xml                Results as XML document
  -i, --insecure           Perform insecure SSL connections
  -h, --help               Show this message and exit.

Commands:
  catalog   Operations with Catalogs
  example   vCloud Air CLI Examples
  firewall  Operations with Edge Gateway Firewall Rules
  gateway   Operations with Edge Gateway
  instance  Operations with Instances
  login     Login to a vCloud service
  logout    Logout from a vCloud service
  nat       Operations with Edge Gateway NAT Rules
  network   Operations with Networks
  org       Operations with Organizations
  plan      Operations with Instances
  status    Show current status
  vapp      Operations with vApps
  vdc       Operations with Virtual Data Centers (vdc)
  vm        Operations with Virtual Machines (VMs)
```

## Accessing vCloud Air RaaS

```console
root@9fcb6949d2c6:~# RaaSCLI

Missing operation!


Usage: /usr/local/bin/RaaSCLI operation [option1] [option2]

	operations: peers|replications|testfailover[or test]|testcleanup[or cleanuptest]|failover[or recovery]

	e.g. /usr/local/bin/RaaSCLI peers
	e.g. /usr/local/bin/RaaSCLI replications ALL
	e.g. /usr/local/bin/RaaSCLI replications <VM name>
	e.g. /usr/local/bin/RaaSCLI testfailover [or test] <VM name>
	e.g. /usr/local/bin/RaaSCLI testfailover [or test] ALL
	e.g. /usr/local/bin/RaaSCLI testcleanup [or cleanuptest] <VM name>
	e.g. /usr/local/bin/RaaSCLI testcleanup [or cleanuptest] cleanuptest ALL
	e.g. /usr/local/bin/RaaSCLI failover [or recovery] <VM name>
	e.g. /usr/local/bin/RaaSCLI failover [or recovery] recovery ALL
```
