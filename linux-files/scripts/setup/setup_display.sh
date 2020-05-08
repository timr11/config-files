#!/bin/bash

if xrandr | grep 'HDMI1 connected'; then
  xrandr --output VIRTUAL1 --off --output eDP1 --off --output DP1 --off --output HDMI2 --off --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP2 --off
elif xrandr | grep 'HDMI-1 connected'; then
  xrandr --output VIRTUAL-1 --off --output eDP-1 --off --output DP-1 --off --output HDMI-2 --off --output HDMI-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-2 --off
elif xrandr | grep 'HDMI-1-1 connected'; then
  xrandr --output DP-0 --off --output DP-1 --off --output eDP-1-1 --off --output DP-1-1 --off --output HDMI-1-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-2 --off --output HDMI-1-2 --off
elif xrandr | grep 'eDP1 connected'; then
  xrandr --output VIRTUAL1 --off --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off
elif xrandr | grep 'eDP-1 connected'; then
  xrandr --output VIRTUAL-1 --off --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-2 --off --output HDMI-1 --off --output DP-2 --off
elif xrandr | grep 'eDP-1-1 connected'; then
  xrandr --output DP-0 --off --output DP-1 --off --output eDP-1-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-1 --off --output HDMI-1-1 --off --output DP-1-2 --off --output HDMI-1-2 --off
fi

