#!/bin/bash

source $LINUX_SETUP_SCRIPTS_DIR/setup_script.sh

### START OF SCRIPT ###
if [ ! -d $HOME/.config ]; then
  mkdir $HOME/.config
fi
cp -fR $LINUX_CONFIG_FILES/static/i3 $HOME/.config

