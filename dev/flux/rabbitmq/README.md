helm install stable/rabbitmq-ha --namespace dev-rabbitmq --generate-name \
    --set persistentVolume.enabled=true \
    --set persistentVolume.storageClass='managed-premium' \
    --set prometheus.operator.enabled=false --set service.type=LoadBalancer