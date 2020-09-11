#!/bin/bash 

curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.7.1 TARGET_ARCH=x86_64 sh -

export PATH=$PWD/istio-1.7.1/bin:$PATH

istioctl install --set profile=demo

kubectl label namespace default istio-injection=enabled

git clone https://github.com/angudadevops/istio-k8s.git

kubectl apply -f deployment.yaml

kubectl apply -f gateway/python-gateway.yaml

kubectl apply -f destination/python-destination-rule.yaml

