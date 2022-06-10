#!/bin/bash

echo install_requirement

apt-get -y update
echo Install ssh
apt install -y ssh
echo Install git
apt install -y git
echo Install curl
apt install -y curl
echo Install k3s
curl -sfL https://get.k3s.io | sh -
echo Install k3d
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
echo Install docker
apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get -y update
apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo service docker start
echo Install ArgoCD
curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
chmod +x /usr/local/bin/argocd
echo "alias k='sudo /usr/local/bin/kubectl'" >> /home/user/.bashrc
