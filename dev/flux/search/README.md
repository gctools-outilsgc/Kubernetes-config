

helm install esearch elastic/elasticsearch --namespace search 

helm install kibana elastic/kibana --namespace search -f values.yaml