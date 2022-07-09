#!/bin/bash

rm -rf /tmp/.X*;

source /home/novnc/tigervnc_base.sh

if [ "${VNC_SERVER}" = "tigervnc" ]; then
  echo "Creating screen if enabled for screen 2: ${ENABLE_SCREEN_2}";
  if [ "${ENABLE_SCREEN_2}" = "1" ]; then
    screen2=$(create_screen "$DISPLAY_2" "$DISPLAY_2_PORT" "${TIGER_VNC_OPTS_2}")
    echo "executing command: ${screen2}";
    eval "${screen2}"
  fi
fi


