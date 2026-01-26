#!/bin/bash

# Export DBUS environment for notifications

# Show Rofi menu
profile=$(printf "performance\nbalanced\npower-saver" | rofi -dmenu -p "Power Profile")
[ -z "$profile" ] && exit

# Use pkexec for GUI sudo prompt
# Convert to lowercase

# Set power profile
powerprofilesctl set "$profile"

# Additional settings
  case "\$profile_lower" in
    performance)
      power-g-
      power-c-
      ;;
    balanced)
      power-c+
      power-g+
      ;;
    power-saver)
      power-c+
      power-g+
  esac
