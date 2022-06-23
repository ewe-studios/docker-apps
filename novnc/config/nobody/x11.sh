#!/bin/bash

rm -rf /tmp/.X*;

# setup env for user nobody
if [ "${DISPLAY_MAX}" = "1" ]; then
  Xvfb "${DISPLAY}" -screen 0 "${DISPLAY_WIDTH_MAX}x${DISPLAY_HEIGHT_MAX}x${DISPLAY_DEPTH}" &
elif [ "${DISPLAY_MAX}" = "-1" ]; then
 Xvfb "${DISPLAY}" -pixdepths 3 32 -fbdir /tmp &
else
  Xvfb "${DISPLAY}" -screen 0 "${DISPLAY_WIDTH}x${DISPLAY_HEIGHT}x${DISPLAY_DEPTH}" &
fi

sleep 1

/usr/bin/x11vnc -ncache 10  x11vnc -rfbauth /home/novnc/x11_password
