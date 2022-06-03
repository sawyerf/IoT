#!/bin/sh

# cd /etc/yum.repos.d/
# sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
# sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
# yum update -y
# cd -

# Token is in `sudo cat /var/lib/rancher/k3s/server/node-token`
curl -sfL https://get.k3s.io | K3S_URL=https://192.168.42.110:6443 K3S_TOKEN=`cat /vagrant_shared/node-token` sh -s - --flannel-iface=eth1
sudo yum install -y net-tools