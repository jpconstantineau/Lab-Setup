helm repo add rancher-stable https://releases.rancher.com/server-charts/stable
helm repo add jetstack https://charts.jetstack.io
helm repo update

kubectl create namespace cattle-system
kubectl create namespace cert-manager


export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
kubectl get pods --all-namespaces
helm ls --all-namespaces

helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --version v0.15.0

helm install rancher rancher-stable/rancher \
  --namespace cattle-system \
  --set hostname=rancher.jpconstantineau.com

  kubectl -n cattle-system rollout status deploy/rancher