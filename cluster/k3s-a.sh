#!/bin/bash

curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="server -t agent-secret-token" sh -s -
k3s kubectl get all --all-namespaces

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/jpconstantineau/Lab-Setup/master/argos/install.yaml
kubectl apply -n argocd -f https://raw.githubusercontent.com/jpconstantineau/Lab-Setup/master/argos/service.yaml

VERSION=$(curl --silent "https://api.github.com/repos/argoproj/argo-cd/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
sudo curl -SL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$VERSION/argocd-linux-amd64
sudo chmod +x /usr/local/bin/argocd


kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2

argocd login --insecure --grpc-web k3s-a

argocd account update-password

argocd app create heimdall --repo https://github.com/jpconstantineau/Lab-Setup.git --path heimdall --dest-server https://kubernetes.default.svc --dest-namespace default