curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent -t agent-secret-token --server https://k3s-m:6443" sh -s -
sudo apt install nfs-common