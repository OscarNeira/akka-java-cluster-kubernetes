#!/usr/bin/env bash

pwd

./minikube/cluster_api/docker_build.sh

pwd

kubectl delete -f minikube/cluster_api/akka-cluster-rolebindging.yml
kubectl delete -f minikube/cluster_api/akka-cluster-deployment.yml

kubectl apply -f minikube/cluster_api/akka-cluster-rolebindging.yml
kubectl apply -f minikube/cluster_api/akka-cluster-deployment.yml

./minikube/cluster_api/expose_service.sh

