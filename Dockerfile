FROM ubuntu:14.04
MAINTAINER renoufa@vmware.com

# Update apt-get
RUN apt-get update

# Install vCLI Pre-Reqs
<<<<<<< HEAD
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
=======
RUN apt-get install -yq build-essential gcc uuid uuid-dev perl libxml-libxml-perl perl-doc libssl-dev e2fsprogs libarchive-zip-perl libcrypt-ssleay-perl libclass-methodmaker-perl libdata-dump-perl libsoap-lite-perl git expect python python-dev python-pip python-virtualenv ruby-full make gem

# Clean up apt-get
RUN apt-get clean
>>>>>>> f11feb8a0664fa8c42b3b59c7871eecccd846709

# Set the working directory to /root
WORKDIR /tmp

# Install vCLI
ADD VMware-vSphere-CLI-5.5.0-2043780.x86_64.tar /tmp/
RUN yes | /tmp/vmware-vsphere-cli-distrib/vmware-install.pl -d \
    && rm -rf vmware-vsphere-cli-distrib \

# Add William Lams awesome scripts from vGhetto Script Repository
RUN mkdir /root/vghetto
RUN git clone https://github.com/lamw/vghetto-scripts.git /root/vghetto

# Add pip
RUN wget https://bootstrap.pypa.io/ez_setup.py -O - | python && \
    easy_install pip

# Add pyVmomi
<<<<<<< HEAD
RUN pip install pyvmomi && \
    mkdir /root/pyvmomi && \
    git clone https://github.com/vmware/pyvmomi.git /root/pyvmomi

# Add vCloud Air CLI - Commented out as fails at the moment - Issue raised https://github.com/vmware/vca-cli/issues/9
# RUN pip install vca-cli

# Add RbVmomi
RUN gem install rbvmomi

# Add RVC
RUN gem install rvc

# Add vcloud-tools - Commented out as fails at the moment - Issue raised: https://github.com/gds-operations/vcloud-tools/issues/210
# RUN gem install vcloud-tools
=======
RUN pip install --upgrade pyvmomi
RUN mkdir /root/pyvmomi
RUN git clone https://github.com/vmware/pyvmomi.git /root/pyvmomi

# Add RbVmomi
RUN gem install rbvmomi

# Add RVC
RUN gem install rvc
>>>>>>> f11feb8a0664fa8c42b3b59c7871eecccd846709

# Add VMware OVFTool
ADD VMware-ovftool-4.0.0-2301625-lin.x86_64.bundle /tmp/
RUN yes | /bin/bash VMware-ovftool-4.0.0-2301625-lin.x86_64.bundle --required --console \
    && rm -f /tmp/VMware-ovftool-4.0.0-2301625-lin.x86_64.bundle \

# Run Bash when the image starts
CMD ["/bin/bash"]
