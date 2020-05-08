#!/bin/bash

source $LINUX_SETUP_SCRIPTS_DIR/setup_script.sh

### START OF SCRIPT ###
if [ ! -d $CONFIG_FILES/static/vim ]; then
  >&2 echo "No vim folder in your ${CONFIG_FILES}/static directory!"
  exit 1
fi
sudo cp $CONFIG_FILES/static/vim/.vimrc $HOME

