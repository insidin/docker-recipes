#!/usr/bin/env bash
su -c "chown -R $USER:$GROUP $DATA_MAPPING_DIR"
su -s /bin/bash -c "$@" $USER
