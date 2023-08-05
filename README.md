# Getting started with ElasticStack and Docker-Compose

## Getting Started

```sh
git clone git@github.com:KunihikoKido/getting-started-with-elasticstack
cd getting-started-with-elasticstack
make start
```

## Accessing Kibana from a browser

* <http://localhost:5601/>
  * Username: elastic
  * Password: changeme

## Accsessing Elasticsearch from curl command

```sh
docker cp elasticstack-es01-1:/usr/share/elasticsearch/config/certs/ca/ca.crt /tmp/.
curl --cacert /tmp/ca.crt -u elastic:changeme https://localhost:9200

```

## Commands

```sh
% make      
usage: make [target] ...

targets:
help        Show this help message.
build       build docler containers
stop        Stop docker containers.
status      Status docker containers.
cli         Run cli
tail        Tail logs for docker containers
clean       Clean docker containers and clean this project
start       Start docker containers.
```
