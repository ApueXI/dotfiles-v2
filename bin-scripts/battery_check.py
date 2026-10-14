#!/usr/bin/env python3

import time
import subprocess
from pathlib import Path

# Configuration
NOTIFY_THRESHOLD = 30
SHUTDOWN_THRESHOLD = 10
SHUTDOWN_TIMER = 120
CHECK_INTERVAL = 300

BATTERY_PATH = Path("/sys/class/power_supply/BAT0")


def read_file(path):
    with open(path, "r") as f:
        return f.read().strip()


def notify(title, message, urgency="critical"):
    subprocess.run(["notify-send", "-u", urgency, title, message])


def shutdown():
    subprocess.run(["systemctl", "poweroff"])


while True:
    try:
        capacity = int(read_file(BATTERY_PATH / "capacity"))
        status = read_file(BATTERY_PATH / "status")

        if status == "Discharging":
            if capacity <= SHUTDOWN_THRESHOLD:
                notify(
                    "Battery Critical",
                    f"Battery at {capacity}%. Shutting down in 2 minutes!",
                )

                time.sleep(SHUTDOWN_TIMER)
                shutdown()

            elif capacity <= NOTIFY_THRESHOLD:
                notify("Low Battery", f"Battery is at {capacity}%. Please plug in.")

        time.sleep(CHECK_INTERVAL)

    except Exception as e:
        print("Error:", e)
        time.sleep(CHECK_INTERVAL)
