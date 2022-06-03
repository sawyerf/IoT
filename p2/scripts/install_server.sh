#!/bin/sh

# cd /etc/yum.repos.d/
# sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
# sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
# yum update -y
# cd -
curl -sfL https://get.k3s.io | sh -s - server --write-kubeconfig-mode K3S_KUBECONFIG_MODE=644 --flannel-iface=eth1

#sudo sed -i 's/secure_path = \/sbin:\/bin:\/usr\/sbin:\/usr\/bin/secure_path = \/sbin:\/bin:\/usr\/sbin:\/usr\/bin:\/usr\/local\/bin:\/usr\/local\/bin:/g' /etc/sudoers
#sudo kubectl create configmap app-one --from-file /vagrant_shared/app1.html
#sudo kubectl create configmap app-two --from-file /vagrant_shared/app2.html

#sudo kubectl apply -f app1.yml
#sudo kubectl apply -f app2.yml
#sudo cp /var/lib/rancher/k3s/server/node-token /vagrant_shared/node-token
