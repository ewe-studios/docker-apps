#!/bin/bash

rm -rf /tmp/.X*;

source /home/novnc/tigervnc_base.sh


if [ "${VNC_SERVER}" = "tigervnc" ]; then
  echo "Creating screen if enabled for screen 1: ${ENABLE_SCREEN_1}";
  screen1=$(create_screen "$DISPLAY_1" "$DISPLAY_1_PORT" "-AlwaysShared=${VNC_ALWAYS_SHARED_SCREEN} -NeverShared=${VNC_NEVER_SHARED_SCREEN} ${TIGER_VNC_OPTS_1} ")
  echo "executing command: ${screen1}";
  eval "${screen1}"
fi

