CLUSTER_NAME="phanaks"
GROUP_NAME="aks"
K8S_VERISON="1.15.7"
NODE_SIZE="Standard_DS2_v2"

# Create aks cluster
az aks create --name ${CLUSTER_NAME} --resource-group ${GROUP_NAME} \
  --location canadacentral --kubernetes-version ${K8S_VERISON} \
  --enable-cluster-autoscale --min-count 1 --max-count 10 \
  --node-vm-size ${NODE_SIZE}  --node-osdisk-size 120

# Set up kubectl to access the cluster api
az aks get-credentials --name ${CLUSTER_NAME} --resource-group ${GROUP_NAME} --admin  
    # --overwrite-existing helps if you have an old cluster with the same name

# Set up linkerd
# Requires linkerd cli
linkerd install | kubectl apply -f -

# Set up an nginx ingress instance with an azure FQDN


# Install Fluxcd, sync with gitops repo
# Requires fluxcd cli
GHUSER="phanoix"
GITOPS_REPO="gctools-outilsgc/Kubernetes-config"

kubectl create ns flux

fluxctl install \
--git-user=${GHUSER} \
--git-email=${GHUSER}@users.noreply.github.com \
--git-url=git@github.com:${GITOPS_REPO} \
--git-path=dev \
--git-readonly=true \
--namespace=flux | kubectl apply -f -

# get deploy key for the repo with
# fluxctl identity --k8s-fwd-ns flux
