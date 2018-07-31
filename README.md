# Kubernetes-config
All the Kubernetes manifest files required to deploy whatever we're running.

Ingress manifests assume that the nginx ingress contriller is installed on the cluster:
```
helm install stable/nginx-ingress --namespace kube-system
```

as well as kube-lego for automated Let's Encrypt certs:
```
helm install stable/kube-lego --namespace kube-system \
  --set config.LEGO_EMAIL={your_email} \
  --set config.LEGO_URL=https://acme-v01.api.letsencrypt.org/directory
  --set rbac.create=true  (if RBAC is enabled)
```

## Metrics services

### Prometheus

Prometheus from Helm chart, rbac needs to be off if using older aks or :
```
helm install --name promy stable/prometheus --set rbac.create=true --set alertmanager.persistentVolume.storageClass=azurefile --set server.persistentVolume.storageClass=managed-standard --namespace data
```

### Kubernetes metrics server for pod autoscaling
For some bizzarre reason, aks doesn't deploy with the default metrics-server included which is needed for horizontal pod autoscaling; it can be deployed manually from https://github.com/kubernetes-incubator/metrics-server/tree/master/deploy/1.8%2B

### Node autoscaling
node autoscaling (for aks, minimum k8s v1.10): https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/cloudprovider/azure/cluster-autoscaler-containerservice.yaml  just need to: 
 * fill out the secrets part, 
 * replace {{ ca_version }} with autoscaler version (at least 1.2 for azure), and 
 * replace --nodes=3:10:nodepool1 the min/max node count and node pool name.
 
The [README](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/cloudprovider/azure/README.md) provides directions on fetching all of that.
