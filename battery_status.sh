# Provide notification when battery level goes below 20% and above 80%

#!/bin/bash
while true; do
    export DISPLAY=:0.0
    battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')
    ac_power=$(cat /sys/class/power_supply/AC/online)

    if [[ $ac_power == "1" ]]; then
        if [[ $battery_level -ge 82 ]]; then
            notify-send "Battery Full" "Level: ${battery_level}%"
            paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
        fi
    else
        if [[ $battery_level -le 20 ]]; then
            notify-send --urgency=CRITICAL "Battery Low" "Level: ${battery_level}%"
            paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
        fi
    fi

    sleep 60
done
