
#### ---- Installer Files ---- ####

OVFTOOl42=VMware-ovftool-4.2.0-4586971-lin.x86_64.bundle

#### ---- Install Package Dependencies ---- ####

apt-get update && \
apt-get install -yq --no-install-recommends \
ca-certificates \
vim && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /var/tmp/*

#### ---- Install OVFTool 4.2 ---- ####

/bin/bash /tmp/VMware-ovftool-4.2.0-4586971-lin.x86_64.bundle --eulas-agreed --required --console && \
 rm -f /tmp/VMware-ovftool-4.2.0-4586971-lin.x86_64.bundle

# apt-get remove all shit
apt-get autoremove -y
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
