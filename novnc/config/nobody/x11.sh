#!/bin/bash

source /home/novnc/x11_base.sh

enabled="$1";
display="$2";
port="$3";
screen="$4";
xfvb_args="$5";

shift;
shift;
shift;
shift;
shift;

if [ "$enabled" = "1" ]; then
  if [ "${VNC_SERVER}" = "x11" ]; then

    screen0_command=""
    if [ "${DISPLAY_MAX}" = "1" ]; then
      screen0_command=$(create_screen "$display" "$screen" "${DISPLAY_WIDTH}x${DISPLAY_HEIGHT}x${DISPLAY_DEPTH}" "${xfvb_args}")
    else
      screen0_command=$(create_screen "$display" "$screen" "${DISPLAY_WIDTH_MAX}x${DISPLAY_HEIGHT_MAX}x${DISPLAY_DEPTH}" "${xfvb_args}")
    fi

    # start Xvfb 1 itself
    echo "executing command: ${screen0_command}";
    eval "${screen0_command}" &

    sleep 1

    /usr/bin/x11vnc -display "${display}" -rbport "${port}" -ncache 10  x11vnc -rfbauth /home/novnc/x11_password "$@"

  fi
fi