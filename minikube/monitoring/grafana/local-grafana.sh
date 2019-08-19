#!/usr/bin/env bash

export POD_NAME=$(kubectl get pods --namespace monitoring -l "app=grafana,release=grafana" -o jsonpath="{.items[0].metadata.name}")

kubectl --namespace monitoring port-forward $POD_NAME 3000

# Grafana plugins
#https://grafana.com/dashboards/8588