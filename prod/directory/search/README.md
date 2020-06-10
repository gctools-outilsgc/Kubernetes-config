

helm install esearch elastic/elasticsearch --namespace search -f values-es.yaml

helm install logstash elastic/logstash --namespace search -f values-logstash.yaml

helm install kibana elastic/kibana --namespace search