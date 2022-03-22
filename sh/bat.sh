#!/bin/sh
bat=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/uevent | grep POWER_SUPPLY_STATUS | cut -d'=' -f2)
echo "$bat% ($status)"
