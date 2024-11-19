#!/bin/sh

when_time=$(date -d "00:00:00 $(curl --silent https://last-emission-stalcraft.vercel.app/RU | \
  grep -E  "^[[:space:]]*[[:digit:]][[:print:]]*[d, s]$" | tr -d ,)" +"%H:%M:%S")

echo "$when_time"

