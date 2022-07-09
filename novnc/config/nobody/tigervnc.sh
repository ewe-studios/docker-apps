#!/bin/bash

rm -rf /tmp/.X*;

source /home/novnc/tigervnc_base.sh

enabled="$1";
display="$2"
display_port="$3"

shift;
shift;
shift;

if [ "${VNC_SERVER}" = "tigervnc" ]; then
  if [ "${enabled}" = "1" ]; then
    echo "Creating screen for display $display";
    screen1=$(create_screen "$display" "$display_port" "$@")
    echo "executing command: ${screen1}";
    eval "$screen1";
  fi
fi

