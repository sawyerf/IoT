#!/bin/bash

# Server Worker
curl -sfL https://get.k3s.io | sh -s - server --flannel-iface=eth1
# Install docker
sudo yum install -y yum-utils
sudo yum-config-manager \
   --add-repo \
   https://download.docker.com/linux/centos/docker-ce.reposervice docker start
sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo systemctl start docker
# Run Gitlab 
kubectl apply -f /vagrant/confs/deployment.yml
kubectl exec deployment/gitlab -- grep 'Password:' /etc/gitlab/initial_root_password
