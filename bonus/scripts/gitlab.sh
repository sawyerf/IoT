#!/bin/bash

sudo argocd login localhost:8080 --username admin --password $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo) --insecure
sudo argocd app create app-gitlab --repo https://192.168.1.110.com/sawyerf/tmp-iot --path playground --dest-server https://kubernetes.default.svc --dest-namespace dev
sudo argocd app sync app-gitlab
