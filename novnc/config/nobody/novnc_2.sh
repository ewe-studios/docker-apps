#!/bin/bash

if [ "${ENABLE_SCREEN_2}" = "1" ]; then
  if [ "${ENABLE_SCREEN_2_NOVNC}" = "1" ]; then
    /home/novnc/noVNC/utils/novnc_proxy \
      --cert /home/novnc/ssl/server.crt \
      --key /home/novnc/ssl/server.key \
      --heartbeat 2 \
      --vnc localhost:5901 \
      --listen 6081
  fi
fi
