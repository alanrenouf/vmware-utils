FROM ubuntu:16.04
MAINTAINER renoufa@vmware.com

# Updated to all vSphere 6.5 tools by @lamw
WORKDIR /root

#### ---- Installer Files ---- ####

ARG VSPHERE65_SDK_PERL=VMware-vSphere-CLI-6.5.0-4566394.x86_64.tar.gz
ARG VSPHERE65_AUTOMATION_SDK_PERL=VMware-vSphere-Automation-SDK-Perl-6.5.0-4571819.zip
ARG VSAN65_SDK_PERL=vsan-sdk-65-perl-4602587.zip
ARG VMWARE_UTILS_INSTALLER=vmware-utils-install.sh

ADD [ \
  "$VSPHERE65_SDK_PERL", \
  "$VSAN65_SDK_PERL", \
  "$VSPHERE65_AUTOMATION_SDK_PERL", \
  "$VMWARE_UTILS_INSTALLER", \
  "/tmp/" \
]

RUN /tmp/$VMWARE_UTILS_INSTALLER

ENV PERL5LIB=/root/VMware-vSphere-Automation-SDK-Perl-6.5.0/client/lib/sdk:/root/VMware-vSphere-Automation-SDK-Perl-6.5.0/client/lib/runtime:/root/VMware-vSphere-Automation-SDK-Perl-6.5.0/client/samples

# Run Bash when the image starts
CMD ["/bin/bash"]
