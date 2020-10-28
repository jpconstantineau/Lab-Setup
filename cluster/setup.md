# Setup of a freshly installed Ubuntu 20.04.1 Server on XPC-NG

1. Install XCP-NG VM tools
2. Run this script

```
sudo curl -sfL https://raw.githubusercontent.com/jpconstantineau/Lab-Setup/master/cluster/setup.sh | sh -
```


3. Reboot

```
sudo curl -sfL https://raw.githubusercontent.com/jpconstantineau/Lab-Setup/master/cluster/k3s-m.sh | sh -
```
```
sudo curl -sfL https://raw.githubusercontent.com/jpconstantineau/Lab-Setup/master/cluster/k3s-1.sh | sh -
```
Your server will now have a k3s cluster running on it.


alternately for a docker rancher setup:

```
sudo curl -sfL https://raw.githubusercontent.com/jpconstantineau/Lab-Setup/master/cluster/setup-docker.sh | sh -
```
