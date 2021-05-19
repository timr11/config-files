#!/bin/bash

source "$LINUX_SETUP_SCRIPTS_DIR/setup_script.sh"

### START OF SCRIPT ###
if [ ! -d "$TIMS_CONFIG_FILES/static/vim" ]; then
  >&2 echo "No vim folder in your ${TIMS_CONFIG_FILES}/static directory!"
  exit 1
fi
cp "$TIMS_CONFIG_FILES/static/vim/.vimrc" "$HOME"
if [ ! -L "$HOME/.vim" ]; then
  ln -s "$TIMS_CONFIG_FILES/static/vim/.vim" "$HOME/.vim"
fi

