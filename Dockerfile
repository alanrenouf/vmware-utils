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

#### ---- Install Package Dependencies ---- ####

RUN apt-get update && \
      apt-get install -yq build-essential \
      gcc \
      gcc-multilib \
      uuid \
      uuid-dev \
      perl \
      libxml-libxml-perl \
      perl-doc \
      libssl-dev \
      e2fsprogs \
      libarchive-zip-perl \
      libcrypt-ssleay-perl \
      libclass-methodmaker-perl \
      libdata-dump-perl \
      libsoap-lite-perl \
      git \
      expect \
      python \
      python-dev \
      python-pip \
      python-virtualenv \
      ruby-full \
      make \
      unzip \
      gem \
      software-properties-common \
      default-jre \
      iputils-ping \
      module-init-tools \
      curl \
      libcurl3 \
      libunwind8 \
      libicu55 \
      vim
RUN apt-get clean

RUN gem install savon
RUN pip install --upgrade pip

#### ---- Install vSphere CLI/SDK for Perl 6.5 ---- ####

ADD $VSPHERE65_SDK_PERL /tmp/
RUN sed -i '2621,2635d' /tmp/vmware-vsphere-cli-distrib/vmware-install.pl
RUN /tmp/vmware-vsphere-cli-distrib/vmware-install.pl -d EULA_AGREED=yes && \
  rm -rf /tmp/vmware-vsphere-cli-distrib/

#### ---- Install vSphere Automation SDK for Perl 6.5 ---- ####

ADD $VSPHERE65_AUTOMATION_SDK_PERL /tmp/
RUN unzip /tmp/$VSPHERE65_AUTOMATION_SDK_PERL && \
  rm -f /tmp/$VSPHERE65_AUTOMATION_SDK_PERL
ENV PERL5LIB=/root/VMware-vSphere-Automation-SDK-Perl-6.5.0/client/lib/sdk:/root/VMware-vSphere-Automation-SDK-Perl-6.5.0/client/lib/runtime:/root/VMware-vSphere-Automation-SDK-Perl-6.5.0/client/samples

#### ---- Install vSphere SDK for Ruby (rbvmomi) 6.5 ---- ####

RUN gem install rbvmomi

#### ---- Install vSphere Automation SDK for Ruby 6.5 ---- ####

ADD $VSPHERE65_AUTOMATION_SDK_RUBY /tmp/
RUN mkdir -p /root/VMware-vSphere-Automation-SDK-Ruby-6.5.0
RUN unzip /tmp/$VSPHERE65_AUTOMATION_SDK_RUBY -d /root/VMware-vSphere-Automation-SDK-Ruby-6.5.0 && \
  rm -f /tmp/$VSPHERE65_AUTOMATION_SDK_RUBY

#### ---- Install vSphere SDK for Python (pyvmomi) 6.5 ---- ####

RUN pip install pyvmomi

#### ---- Install vSphere Automation SDK for Python 6.5 ---- ####

ADD $VSPHERE65_AUTOMATION_SDK_PYTHON /tmp/
RUN unzip /tmp/$VSPHERE65_AUTOMATION_SDK_PYTHON && \
  rm -f /tmp/$VSPHERE65_AUTOMATION_SDK_PYTHON

#### ---- Install vSphere Management SDK for Java 6.5 ---- ####

ADD $VSPHERE65_MGMT_SDK /tmp/
RUN unzip /tmp/$VSPHERE65_MGMT_SDK && \
  rm -f /tmp/$VSPHERE65_MGMT_SDK
RUN mv /root/SDK /root/vSphere-Management-SDK-6.5

#### ---- Install vSphere Automation SDK for Java 6.5 ---- ####

ADD $VSPHERE65_AUTOMATION_SDK_JAVA /tmp/
RUN unzip /tmp/$VSPHERE65_AUTOMATION_SDK_JAVA && \
  rm -f /tmp/$VSPHERE65_AUTOMATION_SDK_JAVA

#### ---- Install VSAN Management SDK for Java 6.5 ---- ####

ADD $VSAN65_SDK_JAVA /tmp/
RUN unzip /tmp/$VSAN65_SDK_JAVA && \
  rm -f /tmp/$VSAN65_SDK_JAVA
RUN cp -rf /root/vsan-sdk-java /root/vSphere-Management-SDK-6.5

#### ---- Install VSAN Management SDK for Perl 6.5 ---- ####

ADD $VSAN65_SDK_PERL /tmp/
RUN unzip /tmp/$VSAN65_SDK_PERL && \
  rm -f /tmp/$VSAN65_SDK_PERL
RUN cp /root/vsan-sdk-perl/bindings/*.pm /root/vsan-sdk-perl/samplecode

#### ---- Install VSAN Management SDK for Python 6.5 ---- ####

ADD $VSAN65_SDK_PYTHON /tmp/
RUN unzip /tmp/$VSAN65_SDK_PYTHON && \
  rm -f /tmp/$VSAN65_SDK_PYTHON
RUN cp /root/vsan-sdk-python/bindings/*.py /root/vsan-sdk-python/samplecode

#### ---- Install VSAN Management SDK for Ruby 6.5 ---- ####

ADD $VSAN65_SDK_RUBY /tmp/
RUN unzip /tmp/$VSAN65_SDK_RUBY && \
  rm -f /tmp/$VSAN65_SDK_RUBY
RUN cp /root/vsan-sdk-ruby/bindings/*.rb /root/vsan-sdk-ruby/samplecode

#### ---- Install OVFTool 4.2 ---- ####

ADD $OVFTOOl42 /tmp/
RUN /bin/bash /tmp/VMware-ovftool-4.2.0-4586971-lin.x86_64.bundle --eulas-agreed --required --console && \
  rm -f /tmp/VMware-ovftool-4.2.0-4586971-lin.x86_64.bundle

#### ---- Install VDDK 6.5 ---- ####

ADD $VDDK65 /root/VDDK-6.5

#### ---- PowerCLI Core 1.0 ---- ####

ADD https://download3.vmware.com/software/vmw-tools/powerclicore/PowerCLI_Core.zip /tmp/
RUN curl -sLO https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.12/powershell_6.0.0-alpha.12-1ubuntu1.16.04.1_amd64.deb
RUN dpkg -i /root/powershell_6.0.0-alpha.12-1ubuntu1.16.04.1_amd64.deb && \
  rm -f /root/powershell_6.0.0-alpha.12-1ubuntu1.16.04.1_amd64.deb
RUN unzip /tmp/PowerCLI_Core.zip -d /root/powershell && rm -f /tmp/PowerCLI_Core.zip
RUN mkdir -p /root/.config/powershell/ && mkdir -p /root/.local/share/powershell/Modules
RUN unzip /root/powershell/PowerCLI.ViCore.zip -d /root/.local/share/powershell/Modules && \
  unzip /root/powershell/PowerCLI.Vds.zip -d /root/.local/share/powershell/Modules
RUN mv /root/powershell/Start-PowerCLI.ps1 /root/.config/powershell/Microsoft.PowerShell_profile.ps1 && \
  rm -rf /root/powershell

#### ---- For the m$ Paint Guru ---- ####
RUN curl -sL "https://get.docker.com/builds/Linux/x86_64/docker-1.12.3.tgz" -o /tmp/docker-1.12.3.tgz && \
  tar -zxvf /tmp/docker-1.12.3.tgz
RUN mv /root/docker/* /usr/bin/
RUN rm -f /tmp/docker-1.12.3.tgz && rmdir /root/docker

RUN curl -sL "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
  chmod +x /usr/local/bin/docker-compose

#### ---- Community Sample Code Repositories ---- ####

RUN mkdir script-repos
RUN git clone https://github.com/lamw/PowerCLI-Example-Scripts /root/script-repos/PowerCLI-Example-Scripts
RUN git clone https://github.com/lamw/powerclicore-docker-container-samples /root/script-repos/powerclicore-docker-container-samples
RUN git clone https://github.com/lamw/vghetto-scripts /root/script-repos/vghetto-scripts
RUN git clone https://github.com/lamw/pyvmomi-community-samples /root-script-repos/pyvmomi-community-samples

# Run Bash when the image starts
CMD ["/bin/bash"]