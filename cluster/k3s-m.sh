curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="server -t agent-secret-token" sh -s -
k3s kubectl get node

curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
helm version
