#!/bin/bash

# Path to visuals config
VISUALS_CONF="$HOME/.config/hypr/visuals.conf"
MONITOR_CONF="$HOME/.config/hypr/hyprland.conf"

# Check if gamemode is active
if [ -f /tmp/gamemode_active ]; then
    # Restore processes
    waybar &
    # hyprpaper &
    swaync &
    hypridle &

    # Restore power profile
    powerprofilesctl set balanced
    
    # Restore visual settings
    sed -i 's/$rounding = 0/$rounding = 10/g' "$VISUALS_CONF"
    sed -i 's/$gaps_out = 0/$gaps_out = 8/g' "$VISUALS_CONF"
    sed -i 's/$border_size = 0/$border_size = 1/g' "$VISUALS_CONF"
    
    sed -i 's/$monitorScale= 2/$monitorScale = 1/g' "$MONITOR_CONF"
    # Remove lock
    rm /tmp/gamemode_active
else
    # Backup current visual settings if not already in gamemode
    if ! grep -q '$rounding = 0' "$VISUALS_CONF"; then
        sed -i 's/$rounding = 10/$rounding = 0/g' "$VISUALS_CONF"
        sed -i 's/$gaps_out = 8/$gaps_out = 0/g' "$VISUALS_CONF"
        sed -i 's/$border_size = 1/$border_size = 0/g' "$VISUALS_CONF"
    fi

    # Kill background processes
    pkill waybar
    pkill hyprpaper
    pkill swaync
    pkill hypridle
    
    # Set performance power profile
    powerprofilesctl set performance
    
    # Create lockfile
    touch /tmp/gamemode_active
    
    # Reload Hyprland to apply visual changes
    hyprctl reload
fi
