#!/bin/sh

#4f3c41
#6f7981

disabled_color=%{F#4f3c41}
enabled_color=%{F#6f7981}

if echo $(bluetoothctl info A4:16:C0:94:C7:07) | grep -q "Connected: yes"; then
  symbol_headphones="$enabled_color"
else
  symbol_headphones="$disabled_color"
fi

if echo $(bluetoothctl info BC:C7:46:37:3A:19) | grep -q "Connected: yes"; then

  battery_percent_str=$(upower -i /org/freedesktop/UPower/devices/battery_ps_controller_battery_bcoc7o46o37o3ao19 | grep "%")
  battery_percent_int=${battery_percent_str:25:-1}

	if [ "$battery_percent_int" -gt 80 ]; then
		symbol_controller="$enabled_color󰝍"
	elif [ "$battery_percent_int" -gt 60 ]; then
		symbol_controller="$enabled_color󰝏"
	elif [ "$battery_percent_int" -gt 40 ]; then
		symbol_controller="$enabled_color󰝎"
	elif [ "$battery_percent_int" -gt 20 ]; then
		symbol_controller="$enabled_color󰝌"
	else
		symbol_controller="$enabled_color󰝋"
	fi

else                                       
  symbol_controller="$disabled_color󰖺"
fi

echo "$symbol_headphones $symbol_controller"
