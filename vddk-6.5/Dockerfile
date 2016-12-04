FROM ubuntu:16.04
MAINTAINER renoufa@vmware.com

# Updated to all vSphere 6.5 tools by @lamw
WORKDIR /root

#### ---- Installer Files ---- ####

ARG VDDK65=VMware-vix-disklib-6.5.0-4604867.x86_64.tar.gz
ADD $VDDK65 /root/

# Run Bash when the image starts
CMD ["/bin/bash"]
