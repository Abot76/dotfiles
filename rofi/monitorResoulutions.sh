#!/bin/bash

# Path to monitor config
CONFIG_FILE="$HOME/.config/hypr/monitors.conf"

# Define display labels and their corresponding monitor config lines
declare -A profiles=(
  ["High"]="monitor = eDP-1, 2256x1504, 0x0, 1.0"
  ["Low"]="monitor = eDP-1, 2256x1504, 0x0, 2.0"
  ["Off"]="monitor = eDP-1, disable"
)

# Show labels in rofi menu
selected=$(printf "High\nLow\nOff" | rofi -dmenu -p "Select monitor profile:")

# Exit if nothing selected or invalid
[ -z "$selected" ] && exit
[ -z "${profiles[$selected]}" ] && exit

# Write the actual config line to monitors.conf
echo "${profiles[$selected]}" > "$CONFIG_FILE"

# Optional: Reload Hyprland config
# hyprctl reload
