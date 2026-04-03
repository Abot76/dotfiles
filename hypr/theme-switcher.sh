#!/bin/bash

# Simplified version without prompt flag
cd "$HOME/.config/hypr" || exit 1

PROGRAM_NAME="./themes"

# Get theme names and show in hyprlauncher dmenu mode
selected_theme=$("$PROGRAM_NAME" -l | sed 's/^name: //' | hyprlauncher --dmenu)

if [[ -n "$selected_theme" ]]; then
    echo "Applying theme: $selected_theme"
    "$PROGRAM_NAME" -c "$selected_theme" && {
        killall hyprpaper 2>/dev/null
        hyprpaper &
        notify-send "Theme Switcher" "Applied: $selected_theme" 2>/dev/null
        echo "✓ Theme applied successfully"
    }
fi
