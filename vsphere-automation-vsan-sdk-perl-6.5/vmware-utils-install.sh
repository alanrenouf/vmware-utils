
#### ---- Installer Files ---- ####

VSPHERE65_SDK_PERL=VMware-vSphere-CLI-6.5.0-4566394.x86_64.tar.gz
VSPHERE65_AUTOMATION_SDK_PERL=VMware-vSphere-Automation-SDK-Perl-6.5.0-4571819.zip
VSAN65_SDK_PERL=vsan-sdk-65-perl-4602587.zip

#### ---- Install Package Dependencies ---- ####

apt-get update && \
apt-get install -yq --no-install-recommends \
build-essential \
gcc \
gcc-multilib \
uuid \
uuid-dev \
perl \
libxml-libxml-perl \
perl-doc \
libssl-dev \
e2fsprogs \
libarchive-zip-perl \
libcrypt-ssleay-perl \
libclass-methodmaker-perl \
libdata-dump-perl \
libsoap-lite-perl \
iputils-ping \
module-init-tools \
unzip \
git \
curl \
vim && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /var/tmp/*

#### ---- Install vSphere CLI/SDK for Perl 6.5 ---- ####

sed -i '2621,2635d' /tmp/vmware-vsphere-cli-distrib/vmware-install.pl && \
/tmp/vmware-vsphere-cli-distrib/vmware-install.pl -d EULA_AGREED=yes && \
rm -rf /tmp/vmware-vsphere-cli-distrib/

#### ---- Install vSphere Automation SDK for Perl 6.5 ---- ####

unzip /tmp/$VSPHERE65_AUTOMATION_SDK_PERL && \
rm -f /tmp/$VSPHERE65_AUTOMATION_SDK_PERL

#### ---- Install VSAN Management SDK for Perl 6.5 ---- ####

unzip /tmp/$VSAN65_SDK_PERL && \
rm -f /tmp/$VSAN65_SDK_PERL && \
cp /root/vsan-sdk-perl/bindings/*.pm /root/vsan-sdk-perl/samplecode

#### ---- Community Sample Code Repositories ---- ####

mkdir script-repos
git clone https://github.com/lamw/vghetto-scripts /root/script-repos/vghetto-scripts

# apt-get remove all shit
apt-get -y purge build-essential \
gcc \
gcc-multilib

apt-get autoremove -y
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
