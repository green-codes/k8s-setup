if [[ ! -d ~/.kube ]] ; then mkdir ~/.kube; fi
sudo cp /etc/kubernetes/admin.conf ~/.kube/config
sudo chown $(id -u):$(id -g) ~/.kube/config
