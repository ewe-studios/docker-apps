#!/bin/bash

source /home/novnc/x11_base.sh

if [ "${VNC_SERVER}" = "x11" ]; then

  screen2_command=""
  if [ "${DISPLAY_MAX}" = "1" ]; then
    screen2_command=$(create_screen "$DISPLAY_2" "$SCREEN_2" "${DISPLAY_WIDTH}x${DISPLAY_HEIGHT}x${DISPLAY_DEPTH}" "${X11_VNC_OPTS_2}")
  else
    screen2_command=$(create_screen "$DISPLAY_2" "$SCREEN_2" "${DISPLAY_WIDTH_MAX}x${DISPLAY_HEIGHT_MAX}x${DISPLAY_DEPTH}" "${X11_VNC_OPTS_2}")
  fi


  # start Xvfb 2 itself
  echo "Creating screen if enabled for screen 2: ${ENABLE_SCREEN_2}";
  if [ "${ENABLE_SCREEN_2}" = "1" ]; then
    # start Xvfb 1 itself
    echo "executing command: ${screen2_command}";
    eval "${screen2_command}" &

    sleep 1

    /usr/bin/x11vnc -display "${DISPLAY_2}" -rbport "${DISPLAY_2_PORT}" -ncache 10  x11vnc -rfbauth /home/novnc/x11_password
  fi
fi