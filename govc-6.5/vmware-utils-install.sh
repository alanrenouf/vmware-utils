
#### ---- Install Package Dependencies ---- ####

apt-get update && \
apt-get install -yq --no-install-recommends \
ca-certificates \
git \
curl \
vim && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /var/tmp/*

#### ---- go ---- ####

curl -sLO https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
tar xvf go1.6.linux-amd64.tar.gz
mv go /usr/local
rm -f go1.6.linux-amd64.tar.gz
export GOPATH=$HOME
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

#### ---- govc ---- ####

curl -sL https://github.com/vmware/govmomi/releases/download/v0.12.0/govc_linux_amd64.gz -o /tmp/govc_linux_amd64.gz
gunzip /tmp/govc_linux_amd64.gz
mv /tmp/govc_linux_amd64 /usr/local/bin/govc
chmod a+x /usr/local/bin/govc

#### ---- govmomi  ---- ####

git clone https://github.com/vmware/govmomi

# apt-get remove all shit
apt-get autoremove -y
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
