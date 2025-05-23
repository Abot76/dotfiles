#!/bin/bash

CONFIG_FILE="/home/bozic/.config/hypr/monitors.conf"

/usr/bin/grep -q '^monitor = eDP-1, highres' "$CONFIG_FILE" && {
    /usr/bin/sed -i 's/^monitor = eDP-1, highres/# monitor = eDP-1, highres/' "$CONFIG_FILE"
    /usr/bin/sed -i 's/^# monitor = eDP-1, disable/monitor = eDP-1, disable/' "$CONFIG_FILE"
    notify-send "Monitor disabled"
} || {
    /usr/bin/sed -i 's/^# monitor = eDP-1, highres/monitor = eDP-1, highres/' "$CONFIG_FILE"
    /usr/bin/sed -i 's/^monitor = eDP-1, disable/# monitor = eDP-1, disable/' "$CONFIG_FILE"
    notify-send "Monitor enabled"
}
