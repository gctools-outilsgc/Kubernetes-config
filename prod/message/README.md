Easiest way to set up a multi-node mongodb replicast is using helm:
```
helm install --name message-db stable/mongodb-replicaset --set replicas=3 --set persistentVolume.storageClass=managed-standard --namespace prod
```

then to scale it up or down:
```
helm upgrade message-db stable/mongodb-replicaset --set replicas=5 --set persistentVolume.storageClass=managed-standard --namespace prod
```
