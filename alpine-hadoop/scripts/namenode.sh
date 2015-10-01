#!/usr/bin/env bash

export HADOOP_LOG_DIR="$HOST_MAPPING_DIR/logs/hadoop"
export YARN_LOG_DIR="$HOST_MAPPING_DIR/logs/yarn"
export HADOOP_IDENT_STRING=$USER
export LOCAL_DATA_DIR="$DATA_MAPPING_DIR/$HOSTNAME"
export HADOOP_NAMENODE_OPTS="-Ddfs.namenode.name.dir=file://$LOCAL_DATA_DIR/dfs $HADOOP_NAMENODE_OPTS"
export YARN_NODEMANAGER_OPTS="-Dyarn.nodemanager.logs-dirs=file://$LOCAL_DATA_DIR/nm-local-log -Dyarn.nodemanager.local-dirs=file://$LOCAL_DATA_DIR/nm-local-dir $YARN_NODEMANAGER_OPTS"

mkdir -p $LOCAL_DATA_DIR/dfs
mkdir -p $LOCAL_DATA_DIR/nm-local-log
mkdir -p $LOCAL_DATA_DIR/nm-local-dir

export

exec hdfs namenode
