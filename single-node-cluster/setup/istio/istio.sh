#!/bin/bash

export version=1.5.1

curl -L https://istio.io/downloadIstio | sh -
./istio-${version}/bin/istioctl manifest apply
kubectl label namespace default istio-injection=enabled
