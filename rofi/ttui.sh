#!/bin/bash

TASKS_BIN="/home/bozic/.config/rofi/tasks"
TASK_FILE="/home/bozic/.config/rofi/tasks.txt"


# Ensure tasks binary exists
if [[ ! -x "$TASKS_BIN" ]]; then
    rofi -e "Binary '$TASKS_BIN' not found or not executable."
    exit 1
fi

# Load tasks
mapfile -t raw_tasks < <($TASKS_BIN l 2>/dev/null)

# Build options from tasks
options=()
for i in "${!raw_tasks[@]}"; do
    task="${raw_tasks[$i]}"
    [[ -n "$task" ]] && options+=("$i: $task")
done

options+=("➕ Add new task")
options+=("! Clear all tasks")

# Prompt user
selection=$(printf '%s\n' "${options[@]}" | rofi -dmenu -p "TTUI Tasks")
[[ -z "$selection" ]] && exit 0

# Handle selections
if [[ "$selection" == *"➕"* ]]; then
    new_task=$(rofi -dmenu -p "New task description")
    [[ -n "$new_task" ]] && $TASKS_BIN a "$new_task"

elif [[ "$selection" == *"!"* ]]; then
    confirm=$(rofi -dmenu -p "Type 'yes' to clear all tasks")
    [[ "$confirm" == "yes" ]] && $TASKS_BIN e

elif [[ "$selection" =~ ^[0-9]+: ]]; then
    task_index=$(echo "$selection" | cut -d':' -f1)
    $TASKS_BIN c "$task_index"
fi
