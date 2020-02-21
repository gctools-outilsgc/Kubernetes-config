Easiest way to set up a multi-node mongodb replicast is using helm:
```
helm install --name dev-message-db stable/mongodb-replicaset --set replicas=1 --set persistentVolume.storageClass=managed-premium --namespace message-dev
```

then to scale it up or down:
```
helm upgrade dev-message-db stable/mongodb-replicaset --set replicas=5 --set persistentVolume.storageClass=managed-premium --namespace message-dev
```
