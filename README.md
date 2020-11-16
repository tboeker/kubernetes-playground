# KUBERNETES

choco install docker-desktop --force
choco install kubernetes-helm

## KUBECTL

kubectl config view

kubectl config unset clusters
kubectl config unset contexts
kubectl config unset users

kubectl cluster-info

## BASH

kubectl apply -f shell-demo.yaml
kubectl get pod shell-demo1


# SCRIPTS

kubectl get pods --namespace $namespace
kubectl get service --namespace $namespace