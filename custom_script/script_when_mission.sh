#!/bin/sh

hours_minutes=$(date -d \
  "$(curl -s https://last-emission-stalcraft.vercel.app/RU | \
  grep -m1 -Eao "[[:digit:]:]{8,10}</article></main>" | \
  cut -b -5) 3 hour" "+%H:%M")
echo "$hours_minutes"
sec=$(( 10#$(date "+%s") - 10#$(date "+%s" -d "$hours_minutes") ))

hour=$(( sec / 3600 ))

min=$(( sec / 60 % 60 ))

if [[ $min -le 9 && $hour -le 9 ]]; then
  echo "$(date -d "0$hour:0$min" "+%I:%M")"
elif [[ $min -le 9 ]]; then
  echo "$(date -d "$hour:0$min" "+%I:%M")"
elif [[ $hour -le 9 ]]; then
  echo "$(date -d "0$hour:$min" "+%I:%M")"
else
  echo "$(date -d "$hour:$min" "+%I:%M")"
fi  
