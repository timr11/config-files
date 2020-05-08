#!/bin/bash

source $LINUX_SETUP_SCRIPTS_DIR/setup_script.sh

### START OF SCRIPT ###
sudo add-apt-repository ppa:robert-ancell/simple-scan
sudo apt-get update
sudo apt-get install simple-scan -y

