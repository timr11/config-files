#!/bin/bash

source $LINUX_SETUP_SCRIPTS_DIR/setup_script.sh

### START OF SCRIPT ###
if [ ! -d $HOME/Pictures/backgrounds ]; then
  mkdir -p $HOME/Pictures/backgrounds
fi
cp $CONFIG_FILES/static/images/background.jpg $HOME/Pictures/backgrounds

