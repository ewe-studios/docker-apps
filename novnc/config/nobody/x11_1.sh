#!/bin/bash

source /home/novnc/x11_base.sh

if [ "${VNC_SERVER}" = "x11" ]; then

  screen0_command=""
  if [ "${DISPLAY_MAX}" = "1" ]; then
    screen0_command=$(create_screen "$DISPLAY_1" "$SCREEN_1" "${DISPLAY_WIDTH}x${DISPLAY_HEIGHT}x${DISPLAY_DEPTH}" "${X11_VNC_OPTS}")
  else
    screen0_command=$(create_screen "$DISPLAY_1" "$SCREEN_1" "${DISPLAY_WIDTH_MAX}x${DISPLAY_HEIGHT_MAX}x${DISPLAY_DEPTH}" "${X11_VNC_OPTS}")
  fi

  # start Xvfb 1 itself
  echo "executing command: ${screen0_command}";
  eval "${screen0_command}" &

  sleep 1

  /usr/bin/x11vnc -display "${DISPLAY_1}" -rbport "${DISPLAY_1_PORT}" -ncache 10  x11vnc -rfbauth /home/novnc/x11_password

fi