#!/bin/sh
if [ -z "$DOCKER_ACCOUNT" ]; then
    DOCKER_ACCOUNT=srujannallandhigal
fi;
kubectl run apache --image=docker.io/$DOCKER_ACCOUNT/microservice-kubernetes-demo-apache:latest --port=80
kubectl expose pod/apache --type="LoadBalancer" --port 80
kubectl run catalog --image=docker.io/$DOCKER_ACCOUNT/microservice-kubernetes-demo-catalog:latest --port=8080
kubectl expose pod/catalog --type="LoadBalancer" --port 8080
kubectl run customer --image=docker.io/$DOCKER_ACCOUNT/microservice-kubernetes-demo-customer:latest --port=8080
kubectl expose pod/customer --type="LoadBalancer" --port 8080
kubectl run order --image=docker.io/$DOCKER_ACCOUNT/microservice-kubernetes-demo-order:latest --port=8080
kubectl expose pod/order --type="LoadBalancer" --port 8080
