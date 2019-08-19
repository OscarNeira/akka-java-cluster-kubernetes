#!/usr/bin/env bash
echo Build Image Cluster K8s api
pwd


./gradlew clean assemble build

eval $(minikube docker-env)

docker save akka-cluster-demo | (eval $(minikube docker-env) && docker load)

docker build -t akka-cluster-demo:latest .

docker images | grep akka