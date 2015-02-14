FROM ubuntu:14.04
MAINTAINER renoufa@vmware.com

# Update apt-get
RUN apt-get update

# Install vCLI Pre-Reqs
RUN apt-get install -yq build-essential \
      gcc \
      uuid \
      uuid-dev \
      perl \
      libxml-libxml-perl \
      libxml2-dev \
      libxslt-dev \
      perl-doc \
      libssl-dev \
      e2fsprogs \
      libarchive-zip-perl \
      libcrypt-ssleay-perl \
      libclass-methodmaker-perl \
      libdata-dump-perl \
      libsoap-lite-perl \
      libssl-dev \
      libffi-dev \
      wget \
      git \
      expect \
      python \
      python-dev \
      python-virtualenv \
      ruby-full \
      make \
      gem && \
    apt-get clean

# Set the working directory to /root
WORKDIR /tmp

# Install vCLI https://developercenter.vmware.com/web/dp/tool/vsphere_cli/5.5
ADD VMware-vSphere-CLI-5.5.0-2043780.x86_64.tar /tmp/
RUN yes | /tmp/vmware-vsphere-cli-distrib/vmware-install.pl -d && \
    rm -rf vmware-vsphere-cli-distrib

# Add William Lams awesome scripts from vGhetto Script Repository
RUN mkdir /root/vghetto && \
    git clone https://github.com/lamw/vghetto-scripts.git /root/vghetto

# Add pip
RUN wget https://bootstrap.pypa.io/ez_setup.py -O - | python && \
    easy_install pip

# Add pyVmomi
RUN pip install pyvmomi && \
    mkdir /root/pyvmomi && \
    git clone https://github.com/vmware/pyvmomi.git /root/pyvmomi

# Add vCloud Air CLI
RUN pip install vca-cli

# Add RbVmomi
RUN gem install rbvmomi

# Add RVC
RUN gem install rvc

# Add vcloud-tools - Commented out as fails at the moment - Issue raised: https://github.com/gds-operations/vcloud-tools/issues/210
# RUN gem install vcloud-tools

# Add VMware OVFTool http://vmware.com/go/ovftool
ADD VMware-ovftool-4.0.0-2301625-lin.x86_64.bundle /tmp/
RUN yes | /bin/bash VMware-ovftool-4.0.0-2301625-lin.x86_64.bundle --required --console && \
    rm -f /tmp/VMware-ovftool-4.0.0-2301625-lin.x86_64.bundle

# Run Bash when the image starts
CMD ["/bin/bash"]
