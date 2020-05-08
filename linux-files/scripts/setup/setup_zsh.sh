#!/bin/bash

source $LINUX_SETUP_SCRIPTS_DIR/setup_script.sh

### START OF SCRIPT ###
if [ ! -f $LINUX_CONFIG_FILES/static/.zshrc ]; then
  echo ".zshrc file missing in your $LINUX_CONFIG_FILES/static directory!"
  exit 1
fi

cp $LINUX_CONFIG_FILES/static/.zshrc $HOME/

