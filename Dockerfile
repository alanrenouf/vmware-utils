FROM ubuntu:14.04
MAINTAINER renoufa@vmware.com

# Set the working directory to /root
WORKDIR /root

# Update apt-get
RUN apt-get update

## -------- vSphere -------- ##

# Install vCLI Pre-Reqs
RUN apt-get install -yq build-essential \
      gcc \
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
      default-jre && \
    apt-get clean

# Install vCLI https://developercenter.vmware.com/web/dp/tool/vsphere_cli/5.5
ADD VMware-vSphere-CLI-5.5.0-2043780.x86_64.tar.gz /tmp/
RUN yes | /tmp/vmware-vsphere-cli-distrib/vmware-install.pl -d && \
    rm -rf /tmp/vmware-vsphere-cli-distrib

# Install VMware OVFTool http://vmware.com/go/ovftool
ADD VMware-ovftool-4.1.0-2459827-lin.x86_64.bundle /tmp/
RUN yes | /bin/bash /tmp/VMware-ovftool-4.1.0-2459827-lin.x86_64.bundle --required --console && \
    rm -f /tmp/VMware-ovftool-4.1.0-2459827-lin.x86_64.bundle

# Add William Lams awesome scripts from vGhetto Script Repository
RUN mkdir /root/vghetto && \
  git clone https://github.com/lamw/vghetto-scripts.git /root/vghetto

# Install rbVmomi &  RVC
RUN gem install rbvmomi rvc ffi
ENV RVC_READLINE /usr/lib/ruby/1.9.1/x86_64-linux/readline.so

# Install pyVmomi (vSphere SDK for Python)
RUN git clone https://github.com/vmware/pyvmomi.git /root/pyvmomi

# Install govc CLI
ADD https://github.com/vmware/govmomi/releases/download/v0.1.0/govc_linux_amd64.gz /tmp/
RUN gunzip /tmp/govc_linux_amd64.gz
RUN mv /tmp/govc_linux_amd64 /usr/local/bin/govc
RUN chmod a+x /usr/local/bin/govc

# Install VDDK
ADD VMware-vix-disklib-5.5.4-2454786.x86_64.tar.gz /tmp/
RUN yes | /tmp/vmware-vix-disklib-distrib/vmware-install.pl -d && \
  rm -rf /tmp/vmware-vix-disklib-distrib

## -------- vCloud Air -------- ##

# Install vca-cli
RUN apt-get install -yq libssl-dev \
     libffi-dev \
     libxml2-dev \
     libxslt-dev && \
    apt-get clean
RUN pip install vca-cli

# Install RaaS CLI
RUN gem install RaaS

# Install vCloud SDK for Python
RUN easy_install -U pip
RUN pip install pyvcloud

## -------- vCloud Director -------- ##

# Install vcloud-tools
RUN gem install --no-rdoc --no-ri vcloud-tools

## vRealize Management Suite ##

# Install Cloud Client http://developercenter.vmware.com/web/dp/tool/cloudclient/3.1.0
ADD cloudclient-3.2.0-2594179-dist.zip /tmp/
RUN unzip /tmp/cloudclient-3.2.0-2594179-dist.zip -d /root
RUN rm -rf /tmp/cloudclient-3.2.0-2594179-dist.zip

# Run Bash when the image starts
CMD ["/bin/bash"]
