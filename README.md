# vmware-utils DockerFile

Docker Image to deploy various VMware and open source related tools to manage a VMware environment

## Why? 

Most VMware Admins create their own box and modify the vMA so much that it becomes a problem when its time to upgrade to the latest version, this way they can easily build their own box and add their own scripts.

1. Download the latest version of vSphere CLI for vSphere 5.5 from here: https://developercenter.vmware.com/web/dp/tool/vsphere_cli/5.5
2. Download the latest version of VMware OVF Tool for Linux 64 bit from here: https://my.vmware.com/web/vmware/details?downloadGroup=OVFTOOL400&productId=353
3. Download / Clone the Dockerfile from this project


## Example folder structure
```.
└── VMware-Utils
    ├── Dockerfile
    ├── VMware-ovftool-4.0.0-2301625-lin.x86_64.bundle
    └── VMware-vSphere-CLI-5.5.0-2043780.x86_64.tar
```
That's it, now just use docker to deploy the image and watch as these and multiple other community projects and scripts are automatically downloaded.

## Example Build
1. CD into the file with the bits from above (VMware-Utils in my example).
2. sudo docker build -t alanrenouf/vmware-utils .

## Example run
```
alan@ubuntu:~/docker$ sudo docker run --rm -it alanrenouf/vmware-utils
root@b649422a095a:/tmp# vicfg-
vicfg-advcfg      vicfg-dns         vicfg-ipsec       vicfg-mpath       vicfg-nics        vicfg-route       vicfg-syslog      vicfg-volume      
vicfg-authconfig  vicfg-dumppart    vicfg-iscsi       vicfg-mpath35     vicfg-ntp         vicfg-scsidevs    vicfg-user        vicfg-vswitch     
vicfg-cfgbackup   vicfg-hostops     vicfg-module      vicfg-nas         vicfg-rescan      vicfg-snmp        vicfg-vmknic      
root@b649422a095a:/tmp#
```
