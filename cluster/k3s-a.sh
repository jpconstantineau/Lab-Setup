#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install nfs-common git -y
sudo apt-get autoremove && apt-get autoclean

sudo sh -c 'echo "precedence ::ffff:0:0/96  100" >> /etc/gai.conf'

curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="server -t agent-secret-token" sh -s -
k3s kubectl get node

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

VERSION=$(curl --silent "https://api.github.com/repos/argoproj/argo-cd/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$VERSION/argocd-linux-amd64
chmod +x /usr/local/bin/argocd

kubectl port-forward svc/argocd-server -n argocd 8080:443

sudo mount /dev/cdrom /mnt
sudo bash /mnt/Linux/install.sh
sudo umount /dev/cdrom

kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2

argocd login localhost