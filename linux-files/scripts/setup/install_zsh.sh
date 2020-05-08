#!/bin/bash

source $LINUX_SETUP_SCRIPTS_DIR/setup_script.sh

### START OF SCRIPT ###
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh
echo "Reboot to change shell officially to zsh."

