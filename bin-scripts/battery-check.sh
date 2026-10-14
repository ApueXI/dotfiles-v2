#!/bin/bash

# Configuration: Set your thresholds here
NOTIFY_THRESHOLD=30
SHUTDOWN_THRESHOLD=10
SHUTDOWN_TIMER=120
CHECK_INTERVAL=300

while true; do
  # Get battery capacity and status from sysfs
  # Note: Replace BAT0 with BAT1 if your system uses a different index
  BATTERY_PATH="/sys/class/power_supply/BAT0"
  CAPACITY=$(cat "$BATTERY_PATH/capacity")
  STATUS=$(cat "$BATTERY_PATH/status")

  if [ "$STATUS" = "Discharging" ]; then
    # Shutdown logic
    if [ "$CAPACITY" -le "$SHUTDOWN_THRESHOLD" ]; then
      notify-send -u critical "Battery Critical" "Battery at $CAPACITY%. Shutting down at 2 minutes!"
      sleep "$SHUTDOWN_TIMER"
      systemctl poweroff

      # Notification logic
    elif [ "$CAPACITY" -le "$NOTIFY_THRESHOLD" ]; then
      notify-send -u critical -a "System" "Low Battery" "Battery is at $CAPACITY%. Please plug in."
    fi
  fi

  sleep "$CHECK_INTERVAL"
done
