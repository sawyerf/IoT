#!/bin/bash

echo install_requirement

sudo apt-get update
# Install git
sudo apt -y install git
# Install k3s
sudo curl -sfL https://get.k3s.io | sh -
# Install k3d
sudo curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
# Install docker
sudo apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
if [[ $? -eq 0 ]]
then
	sudo mkdir -p /etc/apt/keyrings
	sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
	sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
fi
# Install ArgoCD
sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
if [[ $? -eq 0 ]]
then
	sudo chmod +x /usr/local/bin/argocd
fi
