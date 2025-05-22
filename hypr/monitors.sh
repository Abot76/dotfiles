
#!/bin/bash

CONFIG="$HOME/.config/hypr/hyprland.conf"

# Function to update or append monitor lines
update_monitor_line() {
    local name="$1"
    local config="$2"
    if grep -q "^monitor=${name}" "$CONFIG"; then
        sed -i "s/^monitor=${name}.*/monitor=${name},${config}/" "$CONFIG"
    else
        echo "monitor=${name},${config}" >> "$CONFIG"
    fi
}

# Check if HDMI-A-1 is connected using hyprctl
if hyprctl monitors | grep -q "HDMI-A-1"; then
    echo "HDMI-A-1 is connected. Switching to external display."
    update_monitor_line HDMI-A-1 "preferred,auto,1"
    update_monitor_line eDP-1 "disable"
else
    echo "HDMI-A-1 is not connected. Using internal display."
    update_monitor_line HDMI-A-1 "disable"
    update_monitor_line eDP-1 "preferred,auto,1"
fi

# Reload Hyprland config
hyprctl reload
