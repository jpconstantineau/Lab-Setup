<h1 align="center">
  My home Kubernetes cluster
  <br />
  <br />
  <img src="https://i.imgur.com/p1RzXjQ.png">
</h1>
<br />
<div align="center">

---

# :book:&nbsp; Overview

Welcome to my home Kubernetes cluster. This repo _is_ my Kubernetes cluster in a declarative state. [Flux](https://github.com/fluxcd/flux) and [Helm Operator](https://github.com/fluxcd/helm-operator) watch my [deployments](./deployments/) folder and makes the changes to my cluster based on the yaml manifests.

---

## :wrench:&nbsp; Tools

_Below are some of the tools I find useful for working with my cluster_


---

## :computer:&nbsp; Hardware configuration

---

## Hardware

This cluster runs on the following hardware (all nodes are running Ubuntu 20.04 as virtual machines on XCP-NG):

| Device                                  | Count | OS Disk Size | Data Disk Size       | Ram  | Purpose                                          |
|-----------------------------------------|-------|--------------|----------------------|------|--------------------------------------------------|
| K3S-MASTER                              | 1     | 36GB         | N/A                  | 8GB  | k3s Master                                       |


---

## :handshake:&nbsp; Thanks

A lot of inspiration for this repo came from the following people:

- [onedr0p/k3s-gitops](https://github.com/onedr0p/k3s-gitops)


A few help links to setup my k3s cluster

nfs: setup nfs on storage [server](https://vitux.com/install-nfs-server-and-client-on-ubuntu/)