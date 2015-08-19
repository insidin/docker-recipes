# docker-recipes

## Base container images
docker build -t dcd/alpine-java alpine-java

docker build -t dcd/alpine-hadoop alpine-hadoop

docker build -t dcd/alpine-confluent alpine-confluent

## Kafka
(runs on dcd/alpine-confluent)

docker build -t dcd/kafka kafka

## Divolte-collector
docker build -t dcd/divolte-collector divolte-collector
