#!/bin/bash

# Server Worker
curl -sfL https://get.k3s.io | sh -s - server --flannel-iface=eth1
# Install docker
apt update
yes | apt install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
yes | apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin
service docker start
# Run Gitlab 
kubectl apply -f /vagrant/confs/deployment.yml
kubectl exec deployment/gitlab -- grep 'Password:' /etc/gitlab/initial_root_password
