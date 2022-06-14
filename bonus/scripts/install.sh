#!/bin/bash

# Install helm
curl -fsSL -o /tmp/get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 /tmp/get_helm.sh
/tmp/get_helm.sh
# Fix  localhost:8080 unreachable
kubectl config view --raw > ~/.kube/config
# Install gitlab
export GITLAB_HOME=/srv/gitlab
mkdir -p $GITLAB_HOME
sudo docker run --detach \
  --hostname 192.168.1.197 \
  --publish 443:443 --publish 80:80 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 256m \
  gitlab/gitlab-ee:latest
# sudo docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
