#!/bin/bash

# Create Single Node Cluster Using Cilium & Istio
minikube start --driver=virtualbox --network-plugin=cni --memory=8192
minikube ssh -- sudo mount bpffs -t bpf /sys/fs/bpf

# setup cluster environment
./setup/setup.sh
