FROM ubuntu:16.04
MAINTAINER renoufa@vmware.com

# Updated to all vSphere 6.5 tools by @lamw
WORKDIR /root

#### ---- Installer Files ---- ####

ARG VSPHERE65_AUTOMATION_SDK_RUBY=VMware-vSphere-Automation-SDK-Ruby-6.5.0-4571906.zip
ARG VSAN65_SDK_RUBY=vsan-sdk-65-ruby-4602587.zip
ARG VMWARE_UTILS_INSTALLER=vmware-utils-install.sh

ADD [ \
  "$VSPHERE65_AUTOMATION_SDK_RUBY", \
  "$VSAN65_SDK_RUBY", \
  "$VMWARE_UTILS_INSTALLER", \
  "/tmp/" \
]

RUN /tmp/$VMWARE_UTILS_INSTALLER

# Run Bash when the image starts
CMD ["/bin/bash"]
