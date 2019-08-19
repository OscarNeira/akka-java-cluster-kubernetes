#!/usr/bin/env bash

#kubectl expose -n akka-cluster-1 deployment/akka-cluster-demo --type=NodePort --port 8080

KUBE_IP=$(minikube ip)

MANG_PORT=$(kubectl get -n akka-cluster-1 services/akka-cluster-demo -o go-template='{{(index .spec.ports 0).nodePort}}')
HTTP_PORT=$(kubectl get -n akka-cluster-1 services/akka-cluster-demo -o go-template='{{(index .spec.ports 1).nodePort}}')

echo Management port
echo http://$KUBE_IP:$MANG_PORT/ready
echo http://$KUBE_IP:$MANG_PORT/alive

echo HTTP port
echo http://$KUBE_IP:$HTTP_PORT