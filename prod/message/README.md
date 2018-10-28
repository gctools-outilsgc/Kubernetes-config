Note: RocketChat replication doesn't seem to work well for users behind proxies, should be kept at replicas=1 to avoid problems.



Easiest way to set up a multi-node mongodb replicast is using helm:
```
helm install --name message-db stable/mongodb-replicaset --set replicas=3 --set persistentVolume.storageClass=managed-standard --set persistentVolume.size=30Gi --namespace prod
```

then to scale it up or down:
```
helm upgrade message-db stable/mongodb-replicaset --reuse-values --set replicas=5
```

