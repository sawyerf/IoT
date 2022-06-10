# ☸️ Inception-of-Things
Introduction to kubernetes.

## Docs
### Kubernetes
Kubernetes est un système open source qui vise à fournir une « plate-forme permettant d'automatiser le déploiement, la montée en charge et la mise en œuvre de conteneurs d'application sur des clusters de serveurs ».

### K3s
K3s est la version legere de kubernetes (k8s) avec moins de dépendances et un installation plus rapide.

### K3d
Ca permet de lancer k3s dans des dockers. Ce qui facilite la creation de plusieurs nodes (workers) en local. 

### Nodes
*nodes = worker*

C'est une machine ou les pods (conteneurs) sont deployés.
Il peut etre virtuel ou physique.

### Pods
C'est se qui contient un conteneur.
Il possede une ip unique qui lui permet d'utiliser les ports de la machine sans risque de conflit.
Les conteneurs d'un pods partage leurs stockage et leur "ressources reseaux". 
Les pods sont sous-jacent aux nodes.

### Services
C'est un groupe de pods qui travaille ensemble.

### Namespace
C'est se qui permet d'isoler un cluster dans un sous-cluster. Utile quand on a plusieurs projets.

### Ingress
C'est se qui gere l'accees exterieur au service.

### ArgoCD
C'est un outil de déploiement continu ("continuous deployment") qui permet de deployer des systeme kubenetes a partir de git.

![](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi1.wp.com%2Fgoglides.io%2Fwp-content%2Fuploads%2F2020%2F06%2F01-kubernetes-diagram.png%3Fssl%3D1&f=1&nofb=1)

## Command
```
sudo /usr/bin/kubectl get nodes
```

```
sudo /usr/bin/kubectl get all
```

## Links
- [Introduction a K3S (fr)](https://blog.wescale.fr/k3s-le-kubernetes-allege-hautement-disponible/)
- [Red Hat - C'est quoi Kubernetes ?](https://www.redhat.com/fr/topics/containers/what-is-kubernetes)
- [Vagrant Centos/8](https://app.vagrantup.com/centos/boxes/8)
- [Vagrant doc pdf](https://linuxacademy.com/site-content/uploads/2017/12/vagrant-cheatsheet-Linux-Academy.pdf)
- [k3s doc](https://www.invivoo.com/k3s-kubernetes-enfin-ultra-simpl-leger-devoxx/)
- [Official Install k3s](https://rancher.com/docs/k3s/latest/en/quick-start/)
- [Configure k3s](https://rancher.com/docs/k3s/latest/en/advanced/)