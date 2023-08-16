# Provide notification when battery level goes below 20% and above 80%

#!/bin/bash
prev_batt=0

function play_notification_sound() {
    prev_batt=$1    # Update the previous battery level
    paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
}

while true; do
    export DISPLAY=:0.0 # Set the display for notifications to :0.0 (default display)
    battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)') # Extract the battery level
    ac_power=$(cat /sys/class/power_supply/AC/online)   # Check AC power status

    if [[ $ac_power == "1" ]]; then
        if [[ $battery_level -ge 82 ]]; then
            notify-send "Battery Full" "Level: ${battery_level}%"
            if [[ $prev_batt -ne $battery_level ]]; then
                play_notification_sound $battery_level
            fi
        fi
    else
        if [[ $battery_level -le 20 ]]; then
            notify-send --urgency=CRITICAL "Battery Low" "Level: ${battery_level}%"
            if [[ $prev_batt -ne $battery_level ]]; then
                play_notification_sound $battery_level
            fi
        fi
    fi

    sleep 60
done
