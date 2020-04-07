#!/bin/bash

# Install python3
apt-get update && apt-get install -y python3 python3-pip python3-venv

# Install docker
curl -fsSL https://get.docker.com/ | sudo sh

# Install kubectl
curl -sLO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl

# Install kubespray
git clone https://github.com/Life4honor/kubespray.git
chown -R vagrant:vagrant kubespray

