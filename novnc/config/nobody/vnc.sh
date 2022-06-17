#!/bin/bash

if [ "${VNC_SERVER}" = "tigervnc" ]; then
  sh /home/nobody/tigervnc.sh;
elif [ "${VNC}" = "x11" ]; then
  sh /home/nobody/x11.sh;
else
  sh /home/nobody/tigervnc.sh;
fi
