
#### ---- Installer Files ---- ####

VSPHERE65_AUTOMATION_SDK_RUBY=VMware-vSphere-Automation-SDK-Ruby-6.5.0-4571906.zip
VSAN65_SDK_RUBY=vsan-sdk-65-ruby-4602587.zip

#### ---- Install Package Dependencies ---- ####

apt-get update && \
apt-get install -yq --no-install-recommends \
build-essential \
gcc \
gcc-multilib \
libssl-dev \
git \
ruby-full \
make \
unzip \
gem \
curl \
vim && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /var/tmp/*

gem install savon

#### ---- Install vSphere SDK for Ruby (rbvmomi) 6.5 ---- ####

gem install rbvmomi

#### ---- Install vSphere Automation SDK for Ruby 6.5 ---- ####

mkdir -p /root/VMware-vSphere-Automation-SDK-Ruby-6.5.0 && \
unzip /tmp/$VSPHERE65_AUTOMATION_SDK_RUBY -d /root/VMware-vSphere-Automation-SDK-Ruby-6.5.0 && \
rm -f /tmp/$VSPHERE65_AUTOMATION_SDK_RUBY

#### ---- Install VSAN Management SDK for Ruby 6.5 ---- ####

unzip /tmp/$VSAN65_SDK_RUBY && \
rm -f /tmp/$VSAN65_SDK_RUBY && \
cp /root/vsan-sdk-ruby/bindings/*.rb /root/vsan-sdk-ruby/samplecode

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
