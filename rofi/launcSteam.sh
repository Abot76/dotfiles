#!/bin/bash

MONITOR_CONF="$HOME/.config/hypr/hyprland.conf"
pkill -f "steam"

sed -i 's/$monitorScale= 1/$monitorScale = 2/g' "$MONITOR_CONF"

steam -gamepadui -r 60
