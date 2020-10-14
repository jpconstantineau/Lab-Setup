#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install nfs-common git -y
sudo apt-get autoremove && apt-get autoclean

sudo sh -c 'echo "precedence ::ffff:0:0/96  100" >> /etc/gai.conf'

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo usermod -aG docker $USER

curl https://releases.rancher.com/install-docker/19.03.sh | sh

sudo mount /dev/cdrom /mnt
sudo bash /mnt/Linux/install.sh
sudo umount /dev/cdrom