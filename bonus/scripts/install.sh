#!/bin/bash

# Server Worker
curl -sfL https://get.k3s.io | sh -s - server --flannel-iface=enp0s3
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
kubectl apply -f deployment.yml
kubectl exec deployment/gitlab -- grep 'Password:' /etc/gitlab/initial_root_password


# Install gitlab
# export GITLAB_HOME=/srv/gitlab
# mkdir -p $GITLAB_HOME
# sudo docker run --detach \
#   --hostname 192.168.1.197 \
#   --publish 443:443 --publish 80:80 \
#   --name gitlab \
#   --restart always \
#   --volume $GITLAB_HOME/config:/etc/gitlab \
#   --volume $GITLAB_HOME/logs:/var/log/gitlab \
#   --volume $GITLAB_HOME/data:/var/opt/gitlab \
#   --shm-size 256m \
#   gitlab/gitlab-ee:latest
# sudo docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
