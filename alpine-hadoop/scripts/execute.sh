#!/usr/bin/env bash
su -c "chown -R $USER:$GROUP $DATA_MAPPING_DIR"

if [ -f "${HOST_MAPPING_DIR}/install/install.sh" ]; then
  . "${HOST_MAPPING_DIR}/install/install.sh"
fi

su -s /bin/bash -c "$@" $USER
