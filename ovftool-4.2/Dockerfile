FROM ubuntu:16.04
MAINTAINER renoufa@vmware.com

# Updated to all vSphere 6.5 tools by @lamw
WORKDIR /root

#### ---- Installer Files ---- ####

ARG OVFTOOl42=VMware-ovftool-4.2.0-4586971-lin.x86_64.bundle
ARG VMWARE_UTILS_INSTALLER=vmware-utils-install.sh

ADD [ \
  "$OVFTOOl42", \
  "$VMWARE_UTILS_INSTALLER", \
  "/tmp/" \
]

RUN /tmp/$VMWARE_UTILS_INSTALLER

# Run Bash when the image starts
CMD ["/bin/bash"]
