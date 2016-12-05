
#### ---- Installer Files ---- ####

VSPHERE65_MGMT_SDK=VMware-vSphereSDK-6.5.0-4571253.zip
VSPHERE65_AUTOMATION_SDK_JAVA=VMware-vSphere-Automation-SDK-Java-6.5.0-4571808.zip
VSAN65_SDK_JAVA=vsan-sdk-65-java-4602587.zip

#### ---- Install Package Dependencies ---- ####

apt-get update && \
apt-get install -yq --no-install-recommends \
ca-certificates \
default-jdk \
unzip \
vim && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /var/tmp/*

export JAVA_HOME=/usr

#### ---- Install vSphere Management SDK for Java 6.5 ---- ####

unzip /tmp/$VSPHERE65_MGMT_SDK && \
rm -f /tmp/$VSPHERE65_MGMT_SDK && \
mv /root/SDK /root/vSphere-Management-SDK-6.5
cd /root/vSphere-Management-SDK-6.5/vsphere-ws/java/JAXWS
chmod +x build.sh run.sh
./build.sh
cd /root

#### ---- Install vSphere Automation SDK for Java 6.5 ---- ####

unzip /tmp/$VSPHERE65_AUTOMATION_SDK_JAVA && \
rm -f /tmp/$VSPHERE65_AUTOMATION_SDK_JAVA

#### ---- Install VSAN Management SDK for Java 6.5 ---- ####

unzip /tmp/$VSAN65_SDK_JAVA && \
rm -f /tmp/$VSAN65_SDK_JAVA && \
cp -rf /root/vsan-sdk-java /root/vSphere-Management-SDK-6.5
cd /root/vSphere-Management-SDK-6.5/vsan-sdk-java/samplecode
./build.sh
rm -rf /root/vsan-sdk-java

#### ---- Community Sample Code Repositories ---- ####

# apt-get remove all shit
apt-get autoremove -y
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
