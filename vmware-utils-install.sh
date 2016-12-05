
#### ---- Installer Files ---- ####

VSPHERE65_SDK_PERL=VMware-vSphere-CLI-6.5.0-4566394.x86_64.tar.gz
VSPHERE65_MGMT_SDK=VMware-vSphereSDK-6.5.0-4571253.zip
VSPHERE65_AUTOMATION_SDK_RUBY=VMware-vSphere-Automation-SDK-Ruby-6.5.0-4571906.zip
VSPHERE65_AUTOMATION_SDK_PYTHON=VMware-vSphere-Automation-SDK-Python-6.5.0-4571810.zip
VSPHERE65_AUTOMATION_SDK_PERL=VMware-vSphere-Automation-SDK-Perl-6.5.0-4571819.zip
VSPHERE65_AUTOMATION_SDK_JAVA=VMware-vSphere-Automation-SDK-Java-6.5.0-4571808.zip
VSAN65_SDK_RUBY=vsan-sdk-65-ruby-4602587.zip
VSAN65_SDK_PYTHON=vsan-sdk-65-python-4602587.zip
VSAN65_SDK_JAVA=vsan-sdk-65-java-4602587.zip
VSAN65_SDK_PERL=vsan-sdk-65-perl-4602587.zip
VDDK65=VMware-vix-disklib-6.5.0-4604867.x86_64.tar.gz
OVFTOOl42=VMware-ovftool-4.2.0-4586971-lin.x86_64.bundle

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
git \
expect \
python \
python-setuptools \
python-dev \
python-pip \
python-virtualenv \
ruby-full \
make \
unzip \
gem \
software-properties-common \
default-jre \
iputils-ping \
module-init-tools \
curl \
libcurl3 \
libunwind8 \
libicu55 \
wget \
vim && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /var/tmp/*

gem install savon
pip install --upgrade pip

#### ---- Install vSphere CLI/SDK for Perl 6.5 ---- ####

sed -i '2621,2635d' /tmp/vmware-vsphere-cli-distrib/vmware-install.pl && \
/tmp/vmware-vsphere-cli-distrib/vmware-install.pl -d EULA_AGREED=yes && \
rm -rf /tmp/vmware-vsphere-cli-distrib/

#### ---- Install vSphere Automation SDK for Perl 6.5 ---- ####

unzip /tmp/$VSPHERE65_AUTOMATION_SDK_PERL && \
rm -f /tmp/$VSPHERE65_AUTOMATION_SDK_PERL

#### ---- Install vSphere SDK for Ruby (rbvmomi) 6.5 ---- ####

gem install rbvmomi

#### ---- Install vSphere Automation SDK for Ruby 6.5 ---- ####

mkdir -p /root/VMware-vSphere-Automation-SDK-Ruby-6.5.0 && \
unzip /tmp/$VSPHERE65_AUTOMATION_SDK_RUBY -d /root/VMware-vSphere-Automation-SDK-Ruby-6.5.0 && \
rm -f /tmp/$VSPHERE65_AUTOMATION_SDK_RUBY

#### ---- Install vSphere SDK for Python (pyvmomi) 6.5 ---- ####

pip install pyvmomi

#### ---- Install vSphere Automation SDK for Python 6.5 ---- ####

unzip /tmp/$VSPHERE65_AUTOMATION_SDK_PYTHON && \
rm -f /tmp/$VSPHERE65_AUTOMATION_SDK_PYTHON

#### ---- Install vSphere Management SDK for Java 6.5 ---- ####

unzip /tmp/$VSPHERE65_MGMT_SDK && \
rm -f /tmp/$VSPHERE65_MGMT_SDK && \
mv /root/SDK /root/vSphere-Management-SDK-6.5

#### ---- Install vSphere Automation SDK for Java 6.5 ---- ####

unzip /tmp/$VSPHERE65_AUTOMATION_SDK_JAVA && \
rm -f /tmp/$VSPHERE65_AUTOMATION_SDK_JAVA

#### ---- Install VSAN Management SDK for Java 6.5 ---- ####

unzip /tmp/$VSAN65_SDK_JAVA && \
rm -f /tmp/$VSAN65_SDK_JAVA && \
cp -rf /root/vsan-sdk-java /root/vSphere-Management-SDK-6.5

#### ---- Install VSAN Management SDK for Perl 6.5 ---- ####

unzip /tmp/$VSAN65_SDK_PERL && \
rm -f /tmp/$VSAN65_SDK_PERL && \
cp /root/vsan-sdk-perl/bindings/*.pm /root/vsan-sdk-perl/samplecode

#### ---- Install VSAN Management SDK for Python 6.5 ---- ####

unzip /tmp/$VSAN65_SDK_PYTHON && \
rm -f /tmp/$VSAN65_SDK_PYTHON && \
cp /root/vsan-sdk-python/bindings/*.py /root/vsan-sdk-python/samplecode

#### ---- Install VSAN Management SDK for Ruby 6.5 ---- ####

unzip /tmp/$VSAN65_SDK_RUBY && \
rm -f /tmp/$VSAN65_SDK_RUBY && \
cp /root/vsan-sdk-ruby/bindings/*.rb /root/vsan-sdk-ruby/samplecode

#### ---- Install OVFTool 4.2 ---- ####

/bin/bash /tmp/VMware-ovftool-4.2.0-4586971-lin.x86_64.bundle --eulas-agreed --required --console && \
 rm -f /tmp/VMware-ovftool-4.2.0-4586971-lin.x86_64.bundle

#### ---- PowerCLI Core 1.0 ---- ####

wget https://download3.vmware.com/software/vmw-tools/powerclicore/PowerCLI_Core.zip -P /tmp/
curl -sLO https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.12/powershell_6.0.0-alpha.12-1ubuntu1.16.04.1_amd64.deb
dpkg -i /root/powershell_6.0.0-alpha.12-1ubuntu1.16.04.1_amd64.deb && \
rm -f /root/powershell_6.0.0-alpha.12-1ubuntu1.16.04.1_amd64.deb && \
unzip /tmp/PowerCLI_Core.zip -d /root/powershell && rm -f /tmp/PowerCLI_Core.zip && \
mkdir -p /root/.config/powershell/ && mkdir -p /root/.local/share/powershell/Modules && \
unzip /root/powershell/PowerCLI.ViCore.zip -d /root/.local/share/powershell/Modules && \
unzip /root/powershell/PowerCLI.Vds.zip -d /root/.local/share/powershell/Modules && \
mv /root/powershell/Start-PowerCLI.ps1 /root/.config/powershell/Microsoft.PowerShell_profile.ps1 && \
rm -rf /root/powershell

#### ---- go ---- ####

curl -sLO https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
tar xvf go1.6.linux-amd64.tar.gz
mv go /usr/local
rm -f go1.6.linux-amd64.tar.gz
export GOPATH=$HOME
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

#### ---- govc ---- ####

curl -sL https://github.com/vmware/govmomi/releases/download/v0.12.0/govc_linux_amd64.gz -o /tmp/govc_linux_amd64.gz
gunzip /tmp/govc_linux_amd64.gz
mv /tmp/govc_linux_amd64 /usr/local/bin/govc
chmod a+x /usr/local/bin/govc

#### ---- govmomi  ---- ####

git clone https://github.com/vmware/govmomi

#### ---- For the m$ Paint Guru ---- ####
curl -sL "https://get.docker.com/builds/Linux/x86_64/docker-1.12.3.tgz" -o /tmp/docker-1.12.3.tgz && \
tar -zxvf /tmp/docker-1.12.3.tgz

mv /root/docker/* /usr/bin/ && \
rm -f /tmp/docker-1.12.3.tgz && rm -rf /root/docker

curl -sL "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
chmod +x /usr/local/bin/docker-compose

#### ---- Community Sample Code Repositories ---- ####

mkdir script-repos
git clone https://github.com/lamw/PowerCLI-Example-Scripts /root/script-repos/PowerCLI-Example-Scripts
git clone https://github.com/lamw/powerclicore-docker-container-samples /root/script-repos/powerclicore-docker-container-samples
git clone https://github.com/lamw/vghetto-scripts /root/script-repos/vghetto-scripts
git clone https://github.com/lamw/pyvmomi-community-samples /root-script-repos/pyvmomi-community-samples


# apt-get remove all shit
apt-get -y purge build-essential \
gcc \
gcc-multilib

apt-get autoremove -y
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
