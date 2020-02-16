CLUSTER_NAME="phanaks"
GROUP_NAME="aks"
K8S_VERISON="1.15.7"
NODE_SIZE="Standard_DS2_v2"

az aks create --name $(CLUSTER_NAME) --resource-group $(GROUP_NAME) \
    --location canadacentral --kubernetes-version $(K8S_VERISON) \
    --enable-cluster-autoscale true --min-count 1 --max-count 10 \
    --node-vm-size $(NODE_SIZE)  --node-osdisk-size 50 \
    --generate-ssh-keys --vm-set-type AvailabilitySet
