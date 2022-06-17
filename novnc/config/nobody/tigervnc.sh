#!/bin/bash

rm -rf /tmp/.X*;

# setup env for user nobody
OTHER_ARGS="-SecurityTypes=${SECURITY_TYPE}"

if [ -f "/home/nobody/.vnc/passwd" ]; then
  OTHER_ARGS="-PasswordFile /home/nobody/.vnc/passwd"
fi

command="Xvnc :0 -geometry ${DISPLAY_WIDTH}x${DISPLAY_HEIGHT} -depth ${DISPLAY_DEPTH} ${OTHER_ARGS}"
if [ "${DISPLAY_MAX}" = "1" ]; then
  command="Xvnc :0 -geometry ${DISPLAY_WIDTH_MAX}x${DISPLAY_HEIGHT_MAX} -depth ${DISPLAY_DEPTH} ${OTHER_ARGS}"
elif [ "${DISPLAY_MAX}" = "-1" ]; then
  command="Xvnc :0 -depth ${DISPLAY_DEPTH} ${OTHER_ARGS}"
fi

eval "${command}"
