FROM ubuntu:14.04
MAINTAINER renoufa@vmware.com

# Update apt-get
RUN apt-get update

# Install vCLI Pre-Reqs
RUN apt-get install -yq build-essential gcc uuid uuid-dev perl libxml-libxml-perl perl-doc libssl-dev e2fsprogs libarchive-zip-perl libcrypt-ssleay-perl libclass-methodmaker-perl libdata-dump-perl libsoap-lite-perl git expect python python-dev python-pip python-virtualenv ruby-full make gem

# Clean up apt-get
RUN apt-get clean

# Set the working directory to /root
WORKDIR /tmp

# Install vCLI
ADD VMware-vSphere-CLI-5.5.0-2043780.x86_64.tar /tmp/
RUN yes | /tmp/vmware-vsphere-cli-distrib/vmware-install.pl -d \
    && rm -rf vmware-vsphere-cli-distrib \

# Add William Lams awesome scripts from vGhetto Script Repository
RUN mkdir /root/vghetto
RUN git clone https://github.com/lamw/vghetto-scripts.git /root/vghetto

# Add pyVmomi
RUN pip install --upgrade pyvmomi
RUN mkdir /root/pyvmomi
RUN git clone https://github.com/vmware/pyvmomi.git /root/pyvmomi

# Add RbVmomi
RUN gem install rbvmomi

# Add RVC
RUN gem install rvc

# Add VMware OVFTool
ADD VMware-ovftool-4.0.0-2301625-lin.x86_64.bundle /tmp/
RUN yes | /bin/bash VMware-ovftool-4.0.0-2301625-lin.x86_64.bundle --required --console \
    && rm -f /tmp/VMware-ovftool-4.0.0-2301625-lin.x86_64.bundle \

# Run Bash when the image starts
CMD ["/bin/bash"]
