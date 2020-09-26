helm repo add rancher-stable https://releases.rancher.com/server-charts/stable

kubectl create namespace cattle-system

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
kubectl get pods --all-namespaces
helm ls --all-namespaces

helm install rancher rancher-stable/rancher \
  --namespace cattle-system \
  --set hostname=rancher.jpconstantineau.com

  kubectl -n cattle-system rollout status deploy/rancher