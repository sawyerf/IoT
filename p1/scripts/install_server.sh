#!/bin/sh

# cd /etc/yum.repos.d/
# sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
# sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
# yum update -y
# cd -
curl -sfL https://get.k3s.io | sh -s - server --flannel-iface=eth1
sudo cp /var/lib/rancher/k3s/server/node-token /vagrant_shared/node-token
sudo yum install -y net-tools