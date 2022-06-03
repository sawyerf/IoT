#!/bin/sh

# cd /etc/yum.repos.d/
# sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
# sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
# yum update -y
# cd -

# Token is in `sudo cat /var/lib/rancher/k3s/server/node-token`
# curl -sfL https://get.k3s.io | K3S_URL=https://192.168.42.110:6443 K3S_TOKEN="K10fa435d0375b3eb996880779a916c82a389a822523f6a437ed0443f94a862df40::server:3b67d6c32e3798d1b0bb55f3d2d477df" sh -