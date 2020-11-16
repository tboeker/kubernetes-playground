

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo add stable https://charts.helm.sh/stable
helm repo update




# DASHBOARD
# https://artifacthub.io/packages/helm/k8s-dashboard/kubernetes-dashboard

helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm repo update
helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --namespace kubernetes-dashboard --create-namespace --set rbac.clusterReadOnlyRole=true

kubectl get pods --namespace kubernetes-dashboard
kubectl get service --namespace kubernetes-dashboard


# INGRESS
# https://kubernetes.github.io/ingress-nginx/deploy/

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm upgrade --install -f ingress-helm-config.yaml ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace

# helm upgrade --install -f ingress-helm-config.yaml ingress-nginx nginx-stable/nginx-ingress --namespace ingress-nginx --create-namespace
# --set "controller.service.loadBalancerIP=$publicIp" `
# --set "controller.service.annotations.`"service\.beta\.kubernetes\.io/azure-dns-label-name`"=$dnsName"

kubectl get pods --namespace ingress-nginx
kubectl get service --namespace ingress-nginx
kubectl get ingress

# helm delete ingress-nginx --namespace ingress-nginx

# MONGO DB 
helm repo add bitnami https://charts.bitnami.com/bitnami
helm upgrade --install mongodb bitnami/mongodb --namespace mongodb1 --create-namespace --set "auth.enabled=false"

kubectl get pods --namespace mongodb1
kubectl get service --namespace mongodb1

# kubectl delete namespace mongodb1

# mongodb.mongodb1.svc.cluster.local


# EVENT STORE  - DEV

helm repo add eventstore https://eventstore.github.io/EventStore.Charts
helm upgrade --install eventstore eventstore/eventstore --namespace eventstore1 --create-namespace --set "imageTag=release-5.0.8"

# tcp://eventstore.eventstore1.svc.cluster.local:1113

# HEALTH CHECKS

kubectl apply -f https://raw.githubusercontent.com/Xabaril/AspNetCore.Diagnostics.HealthChecks/master/deploy/operator/00-namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/Xabaril/AspNetCore.Diagnostics.HealthChecks/master/deploy/operator/crd/healthcheck-crd.yaml
kubectl apply -f https://raw.githubusercontent.com/Xabaril/AspNetCore.Diagnostics.HealthChecks/master/deploy/operator/01-serviceaccount.yaml
kubectl apply -f https://raw.githubusercontent.com/Xabaril/AspNetCore.Diagnostics.HealthChecks/master/deploy/operator/10-cluster_role.yaml
kubectl apply -f https://raw.githubusercontent.com/Xabaril/AspNetCore.Diagnostics.HealthChecks/master/deploy/operator/11-cluster_role_binding.yaml
kubectl apply -f https://raw.githubusercontent.com/Xabaril/AspNetCore.Diagnostics.HealthChecks/master/deploy/operator/12-operator.yaml