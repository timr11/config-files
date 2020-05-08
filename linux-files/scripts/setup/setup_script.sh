#!/bin/bash

me=`basename "$0"`

function on_debug {
  last_command=$current_command
  current_command=$BASH_COMMAND
}

function on_exit {
  EXIT_CODE="$?"
  if [ $EXIT_CODE -ne 0 ]; then
    echo "$me: \"${last_command}\" command failed with exit code $EXIT_CODE."
  fi
}

if [ -z $LINUX_CONFIG_FILES ]; then
  echo "Set LINUX_CONFIG_FILES in your ~/.zshrc or ~/.bashrc or whatever .*rc"
  exit 1
fi

TMP_DIR="$LINUX_CONFIG_FILES/tmp"
if [ ! -d $TMP_DIR ]; then
  mkdir -p $TMP_DIR
fi

set -e
trap on_debug DEBUG
trap on_exit  EXIT

