#!/bin/sh
kubectl create -f ./mongo-compose.yaml
kubectl create -f ./mongo-service.yaml
kubectl create -f ./spring-deployment.yaml
kubectl create -f ./spring-service.yaml
kubectl create -f ./kubApp.yaml
kubectl create -f ./kubAppService.yaml
kubectl get services
minikube service spring-service --url