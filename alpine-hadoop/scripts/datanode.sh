#!/usr/bin/env bash
trap 'yarn-daemon.sh stop nodemanager; exit 0' SIGTERM

export HADOOP_LOG_DIR="$HOST_MAPPING_DIR/logs/hadoop"
export YARN_LOG_DIR="$HOST_MAPPING_DIR/logs/yarn"
export HADOOP_IDENT_STRING=$USER
export LOCAL_DATA_DIR="$DATA_MAPPING_DIR/$HOSTNAME"
export HADOOP_DATANODE_OPTS="-Ddfs.datanode.data.dir=file://$LOCAL_DATA_DIR/dfs $HADOOP_DATANODE_OPTS"
export YARN_NODEMANAGER_OPTS="-Dyarn.nodemanager.logs-dirs=file://$LOCAL_DATA_DIR/nm-local-log -Dyarn.nodemanager.local-dirs=file://$LOCAL_DATA_DIR/nm-local-dir $YARN_NODEMANAGER_OPTS"

mkdir -p $LOCAL_DATA_DIR/dfs
mkdir -p $LOCAL_DATA_DIR/nm-local-log
mkdir -p $LOCAL_DATA_DIR/nm-local-dir

export 

yarn-daemon.sh start nodemanager

exec hdfs datanode
