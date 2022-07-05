#!/bin/sh

sudo yum install -y net-tools
sudo curl -sfL https://get.k3s.io | sh -s - server --write-kubeconfig-mode K3S_KUBECONFIG_MODE=644 --flannel-iface=eth1
echo "alias k='sudo /usr/local/bin/kubectl'" >> /home/vagrant/.bashrc
sudo /usr/local/bin/kubectl create configmap app1 --from-file /vagrant/confs/app1/index.html
sudo /usr/local/bin/kubectl apply -f /vagrant/confs/app1/app1.yml
sudo /usr/local/bin/kubectl create configmap app2 --from-file /vagrant/confs/app2/index.html
sudo /usr/local/bin/kubectl apply -f /vagrant/confs/app2/app2.yml
sudo /usr/local/bin/kubectl create configmap app3 --from-file /vagrant/confs/app3/index.html
sudo /usr/local/bin/kubectl apply -f /vagrant/confs/app3/app3.yml
