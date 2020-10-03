#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install nfs-common git -y
sudo apt-get autoremove && apt-get autoclean

sudo sh -c 'echo "precedence ::ffff:0:0/96  100" >> /etc/gai.conf'

curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -
k3s kubectl get node

sudo mount /dev/cdrom /mnt
sudo bash /mnt/Linux/install.sh
sudo umount /dev/cdrom