
#### ---- Installer Files ---- ####

VSPHERE65_AUTOMATION_SDK_PYTHON=VMware-vSphere-Automation-SDK-Python-6.5.0-4571810.zip
VSAN65_SDK_PYTHON=vsan-sdk-65-python-4602587.zip

#### ---- Install Package Dependencies ---- ####

apt-get update && \
apt-get install -yq --no-install-recommends \
build-essential \
gcc \
gcc-multilib \
libssl-dev \
git \
python \
python-setuptools \
python-dev \
python-pip \
python-virtualenv \
unzip \
iputils-ping \
module-init-tools \
curl \
vim && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /var/tmp/*

pip install --upgrade pip

#### ---- Install vSphere SDK for Python (pyvmomi) 6.5 ---- ####

pip install pyvmomi

#### ---- Install vSphere Automation SDK for Python 6.5 ---- ####

unzip /tmp/$VSPHERE65_AUTOMATION_SDK_PYTHON && \
rm -f /tmp/$VSPHERE65_AUTOMATION_SDK_PYTHON
chmod +x VMware-vSphere-Automation-SDK-Python-6.5.0/client/bin/run_sample.sh

#### ---- Install VSAN Management SDK for Python 6.5 ---- ####

unzip /tmp/$VSAN65_SDK_PYTHON && \
rm -f /tmp/$VSAN65_SDK_PYTHON && \
cp /root/vsan-sdk-python/bindings/*.py /root/vsan-sdk-python/samplecode

#### ---- Community Sample Code Repositories ---- ####

mkdir script-repos
git clone https://github.com/lamw/vghetto-scripts /root/script-repos/vghetto-scripts
git clone https://github.com/lamw/pyvmomi-community-samples /root-script-repos/pyvmomi-community-samples

# apt-get remove all shit
apt-get -y purge build-essential \
gcc \
gcc-multilib

apt-get autoremove -y
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
