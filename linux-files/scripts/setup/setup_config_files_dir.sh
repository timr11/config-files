#!/bin/bash

source $LINUX_SETUP_SCRIPTS_DIR/setup_script.sh

### START OF SCRIPT ###
print_usage() {
  >&2 echo "Expected usage: ./setup_config_files_dir.sh [config-files dir] [username]"
}

if [ "$#" -ne 2 ]; then
  print_usage
  exit 1
fi
CONFIG_FILES_DIR=$1
USER_NAME=$2
if [ ! -d /home/config-files ]; then
  sudo cp -r $CONFIG_FILES_DIR /home
  sudo chown -R ${USER_NAME}:${USER_NAME} /home/config-files
fi

