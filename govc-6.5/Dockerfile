FROM ubuntu:16.04
MAINTAINER renoufa@vmware.com

# Updated to all vSphere 6.5 tools by @lamw
WORKDIR /root

#### ---- Installer Files ---- ####

ARG VMWARE_UTILS_INSTALLER=vmware-utils-install.sh

ADD $VMWARE_UTILS_INSTALLER /tmp/
RUN /tmp/$VMWARE_UTILS_INSTALLER

# Run Bash when the image starts
CMD ["/bin/bash"]
