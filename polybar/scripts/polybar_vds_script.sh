#!/bin/sh

#4f3c41
#6f7981

disabled_color=%{F#4f3c41}
enabled_color=%{F#6f7981}

server_symbol="$enabled_color󰻴 "

if ! pgrep -f HiddifyCli&> /dev/null 2>&1; then
server_symbol="$disabled_color󰻴 "
fi

echo "$server_symbol"
