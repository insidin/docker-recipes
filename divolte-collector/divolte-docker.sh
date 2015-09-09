#!/bin/bash

: ${DIVOLTE_KAFKA_CONNECT:=$KAFKA_PORT_9092_TCP_ADDR:$KAFKA_PORT_9092_TCP_PORT}
: ${DIVOLTE_SCHEMA_REGISTRY_CONNECT:=$SCHEMAREGISTRY_PORT_8081_TCP_ADDR:$SCHEMAREGISTRY_PORT_8081_TCP_PORT}

export DIVOLTE_KAFKA_CONNECT
export DIVOLTE_SCHEMA_REGISTRY_CONNECT="http://$DIVOLTE_SCHEMA_REGISTRY_CONNECT"

export DIVOLTE_CONF_DIR=/etc/divolte-collector

export JAVA_OPTS="$JAVA_OPTS -Dlogback.configurationFile=$DIVOLTE_CONF_DIR/logback.xml -Dconfig.trace=loads -Dconfig.file=$DIVOLTE_CONF_DIR/divolte-collector.conf"

cd /opt/divolte-collector/

exec bin/divolte-collector
