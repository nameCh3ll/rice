#!/bin/sh

#4f3c41
#6f7981

disabled_color=%{F#4f3c41}
enabled_color=%{F#6f7981}

status_zapret=$(systemctl is-active zapret)
server_symbol="$enabled_color󰲙 "

if [[ $status_zapret == i* ]] then
server_symbol="$disabled_color󰲙 "
fi

echo "$server_symbol"
