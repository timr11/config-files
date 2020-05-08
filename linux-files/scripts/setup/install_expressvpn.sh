#!/bin/bash

source $LINUX_SETUP_SCRIPTS_DIR/setup_script.sh

### START OF SCRIPT ###
DEB_NAME="expressvpn_2.4.2-1_amd64.deb"
DEB_URL="https://download.expressvpn.xyz/clients/linux/$DEB_NAME"

pushd $TMP_DIR
wget $DEB_URL
sudo dpkg -i ./$DEB_NAME
rm $DEB_NAME
popd

