#!/bin/bash

source $LINUX_SETUP_SCRIPTS_DIR/setup_script.sh

### START OF SCRIPT ###
INSTALL_DIR="$HOME/Downloads/programs/"
FILE_NAME="briss-0.9.tar.gz"
if [ ! -f $INSTALL_DIR/$FILE_NAME ]; then
  if [ ! -d $INSTALL_DIR ]; then
    mkdir -p $INSTALL_DIR
  fi
  pushd $INSTALL_DIR
  wget https://astuteinternet.dl.sourceforge.net/project/briss/release%200.9/$FILE_NAME
  tar xzvf $FILE_NAME
  popd
fi

