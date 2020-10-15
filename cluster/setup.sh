#!/bin/bash
sudo touch /etc/cloud/cloud-init.disabled

dpkg-reconfigure cloud-init

sudo dpkg-reconfigure cloud-init
sudo apt-get purge cloud-init
sudo rm -rf /etc/cloud/ && sudo rm -rf /var/lib/cloud/

sudo apt update
sudo apt upgrade -y
sudo apt install nfs-common git -y
sudo apt-get autoremove && apt-get autoclean

sudo sh -c 'echo "precedence ::ffff:0:0/96  100" >> /etc/gai.conf'


sudo mount /dev/cdrom /mnt
sudo bash /mnt/Linux/install.sh
sudo umount /dev/cdrom