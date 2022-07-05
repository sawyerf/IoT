#!/bin/bash

echo '[*] Create namespace'
sudo kubectl create namespace gitlab
echo '[*] Run Gitlab'
sudo /usr/local/bin/kubectl apply -f confs/deployment.yml -n gitlab
echo '[*] Wait Gitlab pods'
sudo kubectl wait pods --all -n gitlab --for condition=Ready --timeout=300s
echo '[*] Get password'
echo "sudo /usr/local/bin/kubectl exec deployment/gitlab -n gitlab -- grep 'Password:' /etc/gitlab/initial_root_password"
