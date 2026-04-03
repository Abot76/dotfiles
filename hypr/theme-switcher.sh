#!/bin/bash

# Change to the directory where your program is
cd "$HOME/.config/hypr" || exit 1  # CHANGE THIS

PROGRAM_NAME="./themes"

# Get theme names, remove "name: " prefix, and show in rofi
selected_theme=$("$PROGRAM_NAME" -l | sed 's/^name: //' | rofi -dmenu -p "Select theme")

if [[ -n "$selected_theme" ]]; then
    echo "Applying theme: $selected_theme"
    "$PROGRAM_NAME" -c "$selected_theme" && {
        # Restart hyprpaper
        killall hyprpaper 2>/dev/null
        hyprpaper &
        
        # Optional notification
        notify-send "Theme Switcher" "Applied: $selected_theme" 2>/dev/null
        echo "✓ Theme applied successfully"
    }
fi
