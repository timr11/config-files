#!/bin/bash

systemctl start bluetooth

bt-device -l

read -p "Enter device: " mac

bluetoothctl connect $mac
