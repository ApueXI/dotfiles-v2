#!/bin/bash

# Configuration
NOTIFY_THRESHOLD=80
CHECK_INTERVAL=300 # 5 minutes is usually a good sweet spot

while true; do
  BATTERY_PATH="/sys/class/power_supply/BAT0"
  CAPACITY=$(cat "$BATTERY_PATH/capacity")
  STATUS=$(cat "$BATTERY_PATH/status")

  # Change 1: Check if status is Charging OR Full
  # Change 2: Use -ge (Greater than or Equal)
  if [ "$STATUS" = "charging" ] || [ "$STATUS" = "Not charging" ] || [ "$STATUS" = "Full" ]; then
    if [ "$CAPACITY" -ge "$NOTIFY_THRESHOLD" ]; then
      notify-send -u critical -a "System" "Battery Charged" "Battery is at $CAPACITY%. You can unplug now."
    fi
  fi

  sleep "$CHECK_INTERVAL"
done
