#!/bin/bash
# modified from http://ficate.com/blog/2012/10/15/battery-life-in-the-land-of-tmux/

batt_colour_inactive=colour241
batt_colour_critical=colour196
batt_colour_charging=colour41
batt_colour_discharging=colour172
batt_colour=$batt_colour_inactive

batt_info=`ioreg -rc AppleSmartBattery`
batt_installed=$(echo $batt_info | grep -o '"BatteryInstalled" = [A-z]\+' | awk '{print $3}')
batt_external_connected=$(echo $batt_info | grep -o '"ExternalConnected" = [A-z]\+' | awk '{print $3}')
batt_is_charging=$(echo $batt_info | grep -o '"IsCharging" = [A-z]\+' | awk '{print $3}')
batt_fully_charged=$(echo $batt_info | grep -o '"FullyCharged" = [A-z]\+' | awk '{print $3}')
batt_current_charge=$(echo $batt_info | grep -o '"CurrentCapacity" = [0-9]\+' | awk '{print $3}')
batt_total_charge=$(echo $batt_info | grep -o '"MaxCapacity" = [0-9]\+' | awk '{print $3}')
batt_percentage=$(( ${batt_current_charge} * 100 / ${batt_total_charge} ))

if [ "$batt_installed" == "Yes" ]; then
  if [ "$batt_fully_charged" == "Yes" ] && [ "$batt_external_connected" == "Yes" ]; then
    batt_colour=$batt_colour_inactive
  elif [ "$batt_is_charging" == "Yes" ]; then
    batt_colour=$batt_colour_charging
  elif (( "$batt_percentage" < 11 )); then
    batt_colour=$batt_colour_critical
  else
    batt_colour=$batt_colour_discharging
  fi

  batt_message="#[fg=${batt_colour}]${batt_percentage}%"

fi

echo -n "${batt_message}"
