FROM ubuntu:16.04
MAINTAINER renoufa@vmware.com

# Updated to all vSphere 6.5 tools by @lamw
WORKDIR /root

#### ---- Installer Files ---- ####

ARG VSPHERE65_AUTOMATION_SDK_PYTHON=VMware-vSphere-Automation-SDK-Python-6.5.0-4571810.zip
ARG VSAN65_SDK_PYTHON=vsan-sdk-65-python-4602587.zip
ARG VMWARE_UTILS_INSTALLER=vmware-utils-install.sh

ADD [ \
  "$VSPHERE65_AUTOMATION_SDK_PYTHON", \
  "$VSAN65_SDK_PYTHON", \
  "$VMWARE_UTILS_INSTALLER", \
  "/tmp/" \
]

RUN /tmp/$VMWARE_UTILS_INSTALLER

# Run Bash when the image starts
CMD ["/bin/bash"]
