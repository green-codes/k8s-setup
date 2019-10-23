#!/bin/bash

sudo ufw allow 443/tcp
sudo ufw allow 8080/tcp
sudo ufw allow 6443/tcp
sudo ufw allow 8285/udp # flannel
sudo ufw allow 8472/udp # flannel

# control plane
sudo swapoff -a
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
#read -p "Press enter to continue"

# user config - NOTE: gives cluster admin access to the current user
if [[ ! -d ~/.kube ]] ; then mkdir ~/.kube; fi
sudo cp /etc/kubernetes/admin.conf ~/.kube/config
sudo chown $(id -u):$(id -g) ~/.kube/config

# flannel
#kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/2140ac876ef134e0ed5af15c65e414cf26827915/Documentation/kube-flannel.yml
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

# allow worker pods on master
#kubectl taint node <master> node-role.kubernetes.io/master:NoSchedule-
