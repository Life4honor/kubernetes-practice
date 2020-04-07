#!/bin/bash

# Enable ssh connection with passwd
sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd

# Install python3
apt-get update && apt-get install -y python3 python3-pip python3-venv

# Install docker
curl -fsSL https://get.docker.com/ | sudo sh

# Install kubectl
curl -sLO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl

# Install kubespray
git clone https://github.com/kubernetes-sigs/kubespray.git
chown -R vagrant:vagrant kubespray

# Declare IPS for cluster
declare -a IPS=(192.168.0.2 192.168.0.3)
echo ${IPS[@]} > node_ips

