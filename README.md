# Kubernetes-config
All the Kubernetes manifest files required to deploy whatever we're running.

Ingress manifests assume that the nginx ingress contriller is installed on the cluster.
```
helm install stable/nginx-ingress --namespace kube-system
```
