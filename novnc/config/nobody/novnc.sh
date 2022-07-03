#!/bin/bash

/home/novnc/noVNC/utils/novnc_proxy \
  --cert /home/novnc/ssl/server.cert \
  --key /home/novnc/ssl/server.key \
  --heartbeat 2 \
  --vnc localhost:5900 \
  --listen 6080