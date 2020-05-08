#!/bin/bash

# This does not install: zsh

echo "**Starting"

if [ ! -d /home/config-files ]; then
  >&2 echo "First copy config-files into /home"
  exit 1
fi

if [ -z $LINUX_SETUP_SCRIPTS_DIR ] || [ -z $LINUX_CONFIG_FILES ]; then
  echo "Set LINUX_SETUP_SCRIPTS_DIR and LINUX_CONFIG_FILES in your ~/.zshrc or ~/.bashrc or whatever .*rc"
  exit 1
fi

$LINUX_SETUP_SCRIPTS_DIR/setup_statics.sh
echo "**Statics successfully setup!"

echo "Running sudo apt-get update..."
sudo apt-get update
echo "Finished running sudo apt-get update."

# need add-apt-repository first to add ppas later
command -v add-apt-repository || sudo apt-get install software-properties-common -y

sudo apt install snap
echo "**snap installed!"
sudo apt install snapd
echo "**snapd installed!"
if ! systemctl is-enabled snapd >/dev/null; then
  sudo systemctl start snapd
  sudo systemctl enable snapd
  echo "**snapd service enabled!"
fi
if ! systemctl is-enabled apparmor >/dev/null; then
  sudo systemctl start apparmor
  sudo systemctl enable apparmor
  echo "**apparmor service enabled!"
fi

command -v briss >/dev/null || $LINUX_SETUP_SCRIPTS_DIR/install_briss.sh
echo "**briss installed!"
command -v cmake >/dev/null || sudo apt-get install cmake -y
echo "**cmake installed!"
command -v compton >/dev/null || sudo apt-get install compton -y
echo "**compton installed!"
command -v conky >/dev/null || sudo apt-get install conky -y
echo "**conky installed!"
command -v convert >/dev/null || sudo apt install imagemagick -y
echo "**convert installed!"
command -v cmatrix >/dev/null || sudo apt-get install cmatrix -y
echo "**cmatrix installed!"
command -v dmenu >/dev/null || sudo apt-get install dmenu -y
echo "**dmenu installed!"
command -v expressvpn >/dev/null || $LINUX_SETUP_SCRIPTS_DIR/install_expressvpn.sh
echo "**expressvpn installed!"
command -v evince >/dev/null || sudo apt-get install evince -y
echo "**evince installed!"
command -v feh >/dev/null || sudo apt-get install feh -y
echo "**feh installed!"
command -v firefox >/dev/null || sudo apt-get install firefox -y || sudo apt-get install firefox-esr -y
echo "**firefox installed!"
command -v glxinfo >/dev/null || sudo apt-get install mesa-utils -y
echo "**mesa-utils (glxinfo) installed!"
command -v i3lock >/dev/null || sudo apt install i3lock
echo "**i3lock installed!"
command -v mupdf >/dev/null || sudo apt-get install mupdf -y
echo "**mupdf installed!"
command -v nomacs >/dev/null || sudo apt-get install nomacs -y
echo "**nomacsinstalled!"
command -v redshift >/dev/null || sudo apt-get install redshift -y
echo "**redshift installed!"
command -v scrot >/dev/null || sudo apt install scrot
echo "**scrot installed!"
command -v skanlite >/dev/null || sudo apt install skanlite
echo "**skanlite installed!"
command -v spotify >/dev/null || sudo snap install spotify
echo "**spotify installed!"
command -v vim >/dev/null || sudo apt-get install vim -y
echo "**vim installed!"
sudo apt-get install gnutls-dev -y

echo "Make sure to setup default terminal in $LINUX_CONFIG_FILES/static/i3/config"

