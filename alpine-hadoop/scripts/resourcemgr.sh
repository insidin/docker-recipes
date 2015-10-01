#!/usr/bin/env bash
trap 'mr-jobhistory-daemon.sh stop historyserver; exit 0' SIGTERM

export YARN_LOG_DIR="$HOST_MAPPING_DIR/logs/yarn"
export HADOOP_MAPRED_LOG_DIR="$HOST_MAPPING_DIR/logs/mapred"
export LOCAL_DATA_DIR="$DATA_MAPPING_DIR/$HOSTNAME"
export YARN_NODEMANAGER_OPTS="-Dyarn.nodemanager.logs-dirs=file://$LOCAL_DATA_DIR/nm-local-log -Dyarn.nodemanager.local-dirs=file://$LOCAL_DATA_DIR/nm-local-dir $YARN_NODEMANAGER_OPTS"

mkdir -p $LOCAL_DATA_DIR/nm-local-log
mkdir -p $LOCAL_DATA_DIR/nm-local-dir

export

mr-jobhistory-daemon.sh start historyserver

exec yarn resourcemanager
