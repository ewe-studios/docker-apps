#!/bin/bash

if [ "${VNC_SERVER}" = "tigervnc" ]; then
  sh /home/novnc/tigervnc.sh;
elif [ "${VNC}" = "x11" ]; then
  sh /home/novnc/x11.sh;
else
  sh /home/novnc/tigervnc.sh;
fi
