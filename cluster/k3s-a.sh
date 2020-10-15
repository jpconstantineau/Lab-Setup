#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install nfs-common git -y
sudo apt-get autoremove && apt-get autoclean

sudo sh -c 'echo "precedence ::ffff:0:0/96  100" >> /etc/gai.conf'

curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="server -t agent-secret-token" sh -s -
k3s kubectl get node

kubectl create ns flux

export GHUSER="jpconstantineau"
fluxctl install \
--git-user=${GHUSER} \
--git-email=${GHUSER}@users.noreply.github.com \
--git-url=git@github.com:${GHUSER}/Lab-Setup \
--git-path=deployments \
--namespace=flux | kubectl apply -f -

sudo mount /dev/cdrom /mnt
sudo bash /mnt/Linux/install.sh
sudo umount /dev/cdrom