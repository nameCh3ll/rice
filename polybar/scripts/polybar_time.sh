#!/bin/sh
time_icon=(󰎡 󰎤 󰎧 󰎪 󰎭 󰎱 󰎳 󰎶 󰎹 󰎼)

time_number_hour_0="$(date "+%H" | cut --bytes=1)"
time_number_hour_1="$(date "+%H" | cut --bytes=2)"

time_number_minute_0="$(date "+%M" | cut --bytes=1)"
time_number_minute_1="$(date "+%M" | cut --bytes=2)"

echo "${time_icon[time_number_hour_0]} ${time_icon[time_number_hour_1]} : ${time_icon[time_number_minute_0]} ${time_icon[time_number_minute_1]}"
