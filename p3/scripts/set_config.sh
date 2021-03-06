#!/bin/bash

echo set_config

sudo kubectl create namespace argocd
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.3.4/manifests/install.yaml
sudo kubectl wait pods --all -n argocd --for condition=Ready --timeout=90s
sudo kubectl port-forward svc/argocd-server -n argocd 8080:443 --address 0.0.0.0 1>&- &
sleep 1
sudo kubectl create namespace dev
sudo argocd login localhost:8080 --username admin --password $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo) --insecure
sudo argocd app create app-github --repo https://github.com/sawyerf/vsaltel-tmp-iot --path playground --dest-server https://kubernetes.default.svc --dest-namespace dev
sudo argocd app sync app-github

#sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
#sudo argocd login localhost:8080
#sudo kubectl config get-contexts -o name
#sudo argocd app create guestbook --repo https://github.com/vsaltel/argocd_test --path guestbook --dest-server https://kubernetes.default.svc --dest-namespace dev
