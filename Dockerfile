FROM ubuntu:16.04
MAINTAINER renoufa@vmware.com

# Updated to all vSphere 6.5 tools by @lamw
WORKDIR /root

#### ---- Installer Files ---- ####

ARG VSPHERE65_SDK_PERL=VMware-vSphere-CLI-6.5.0-4566394.x86_64.tar.gz
ARG VSPHERE65_MGMT_SDK=VMware-vSphereSDK-6.5.0-4571253.zip
ARG VSPHERE65_AUTOMATION_SDK_RUBY=VMware-vSphere-Automation-SDK-Ruby-6.5.0-4571906.zip
ARG VSPHERE65_AUTOMATION_SDK_PYTHON=VMware-vSphere-Automation-SDK-Python-6.5.0-4571810.zip
ARG VSPHERE65_AUTOMATION_SDK_PERL=VMware-vSphere-Automation-SDK-Perl-6.5.0-4571819.zip
ARG VSPHERE65_AUTOMATION_SDK_JAVA=VMware-vSphere-Automation-SDK-Java-6.5.0-4571808.zip
ARG VSAN65_SDK_RUBY=vsan-sdk-65-ruby-4602587.zip
ARG VSAN65_SDK_PYTHON=vsan-sdk-65-python-4602587.zip
ARG VSAN65_SDK_JAVA=vsan-sdk-65-java-4602587.zip
ARG VSAN65_SDK_PERL=vsan-sdk-65-perl-4602587.zip
ARG VDDK65=VMware-vix-disklib-6.5.0-4604867.x86_64.tar.gz
ARG OVFTOOl42=VMware-ovftool-4.2.0-4586971-lin.x86_64.bundle
ARG VMWARE_UTILS_INSTALLER=vmware-utils-install.sh

ADD [ \
  "$VSPHERE65_SDK_PERL", \  
  "$VSPHERE65_MGMT_SDK", \
  "$VSPHERE65_AUTOMATION_SDK_RUBY", \
  "$VSPHERE65_AUTOMATION_SDK_PYTHON", \
  "$VSPHERE65_AUTOMATION_SDK_PERL", \
  "$VSPHERE65_AUTOMATION_SDK_JAVA", \
  "$VSAN65_SDK_RUBY", \
  "$VSAN65_SDK_PYTHON", \
  "$VSAN65_SDK_JAVA", \
  "$VSAN65_SDK_PERL", \
  "$VDDK65", \
  "$OVFTOOl42", \
  "$VMWARE_UTILS_INSTALLER", \
  "/tmp/" \
]

RUN /tmp/$VMWARE_UTILS_INSTALLER

ENV PERL5LIB=/root/VMware-vSphere-Automation-SDK-Perl-6.5.0/client/lib/sdk:/root/VMware-vSphere-Automation-SDK-Perl-6.5.0/client/lib/runtime:/root/VMware-vSphere-Automation-SDK-Perl-6.5.0/client/samples

# Run Bash when the image starts
CMD ["/bin/bash"]
