#!/bin/bash

battery_full_message="Hi Pankaj, Battery is full, Please disconnect the charger"
battery_low_message="Hi Pankaj, Battery is low, Please connect the charger"

battery_low_percent=40
battery_full_percent=85

discharging_status="discharging"
charging_status="charging"

while [[ 1 ]]; do

    # get the battery charging status and percent
    battery_status=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state" | awk -F ':[ ]+' '{print $2}')
    battery_percent=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "percentage" | awk -F ':[ ]+' '{print $2} '| sed 's/.$//')

    if [[ $battery_percent -le $battery_low && $battery_status == $discharging_status ]]; then
        # if battery is lower than 40% and discharging then speak low message
        succuss=$($HOME/gspeak/gspeak en "$battery_low_message")
    elif [[ $battery_percent -ge $battery_full_percent && $battery_status == $charging_status ]]; then
        # else if battery is higher than 85% and charging then speak high message
        succuss=$($HOME/gspeak/gspeak en "$battery_full_message")
    fi
    
    # sleep the script
    sleep 5m

done