#!/bin/bash

rm -rf /tmp/.X*;

# setup env for user nobody
command="Xvfb ${DISPLAY} -screen 0 ${DISPLAY_WIDTH}x${DISPLAY_HEIGHT}x${DISPLAY_DEPTH} ${X11_VNC_OPTS} &"
if [ "${DISPLAY_MAX}" = "1" ]; then
  command="Xvfb ${DISPLAY} -screen 0 ${DISPLAY_WIDTH_MAX}x${DISPLAY_HEIGHT_MAX}x${DISPLAY_DEPTH} ${X11_VNC_OPTS} &"
elif [ "${DISPLAY_MAX}" = "-1" ]; then
 command="Xvfb ${DISPLAY} -pixdepths 3 32 -fbdir /tmp ${X11_VNC_OPTS} &"
fi

echo "executing command: ${command}";

# start tigervnc itself
eval "${command}"

sleep 1

/usr/bin/x11vnc -ncache 10  x11vnc -rfbauth /home/novnc/x11_password
