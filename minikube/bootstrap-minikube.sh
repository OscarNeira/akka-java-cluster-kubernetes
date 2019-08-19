#! /bin/bash

minikube addons enable metrics-server

kubectl apply -f helm/service-account.yml
kubectl apply -f helm/role-binding.yml
helm init --service-account tiller --wait

# Monitoring

kubectl apply -f monitoring/namespace.yml
helm install stable/prometheus \
    --namespace monitoring \
    --name prometheus

kubectl apply -f monitoring/grafana/config.yml
helm install stable/grafana \
    -f monitoring/grafana/values.yml \
    --namespace monitoring \
    --name grafana

kubectl get secret \
    --namespace monitoring \
    grafana \
    -o jsonpath="{.data.admin-password}" \
    | base64 --decode ; echo


