kubectl create namespace argocd
kubectl apply -n argocd -f install.yaml
kubectl apply -n argocd -f service.yaml
