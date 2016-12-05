FROM ubuntu:16.04
MAINTAINER renoufa@vmware.com

# Updated to all vSphere 6.5 tools by @lamw
WORKDIR /root

#### ---- Installer Files ---- ####

ARG VSPHERE65_MGMT_SDK=VMware-vSphereSDK-6.5.0-4571253.zip
ARG VSPHERE65_AUTOMATION_SDK_JAVA=VMware-vSphere-Automation-SDK-Java-6.5.0-4571808.zip
ARG VSAN65_SDK_JAVA=vsan-sdk-65-java-4602587.zip
ARG VMWARE_UTILS_INSTALLER=vmware-utils-install.sh

ADD [ \
  "$VSPHERE65_MGMT_SDK", \
  "$VSPHERE65_AUTOMATION_SDK_JAVA", \
  "$VSAN65_SDK_JAVA", \
  "$VMWARE_UTILS_INSTALLER", \
  "/tmp/" \
]

RUN /tmp/$VMWARE_UTILS_INSTALLER

ENV JAVA_HOME=/usr

# Run Bash when the image starts
CMD ["/bin/bash"]
