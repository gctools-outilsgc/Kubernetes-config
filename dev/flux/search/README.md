

helm install esearch elastic/elasticsearch --namespace dev-search -f values-es.yaml

helm install logstash elastic/logstash --namespace dev-search -f values-logstash.yaml

helm install kibana elastic/kibana --namespace dev-search