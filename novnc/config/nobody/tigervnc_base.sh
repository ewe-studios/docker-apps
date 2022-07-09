#!/bin/bash

rm -rf /tmp/.X*;

# setup env for user nobody
OTHER_ARGS="-SecurityTypes=${SECURITY_TYPE} -X509Cert /home/novnc/ssl/server.crt -X509Key /home/novnc/ssl/server.key"

if [ -f "/home/novnc/.vnc/passwd" ]; then
  OTHER_ARGS="-SecurityTypes=${SECURITY_TYPE} -PasswordFile /home/novnc/.vnc/passwd -X509Cert /home/novnc/ssl/server.crt -X509Key /home/novnc/ssl/server.key"
fi

create_screen() {
  display="$1";
  port="$2"
  other_args="$3";

  command="Xvnc ${display} -rfbport ${port} -geometry ${DISPLAY_WIDTH}x${DISPLAY_HEIGHT} -depth ${DISPLAY_DEPTH} -FrameRate=${VNC_FRAMERATE} ${OTHER_ARGS} ${other_args}"
  if [ "${DISPLAY_MAX}" = "1" ]; then
    command="Xvnc ${display} -rfbport ${port} -geometry ${DISPLAY_WIDTH_MAX}x${DISPLAY_HEIGHT_MAX} -depth ${DISPLAY_DEPTH} -FrameRate=${VNC_FRAMERATE} ${OTHER_ARGS} ${other_args}"
  elif [ "${DISPLAY_MAX}" = "-1" ]; then
    command="Xvnc ${display} -rfbport ${port} -depth ${DISPLAY_DEPTH} -FrameRate=${VNC_FRAMERATE} ${OTHER_ARGS} ${other_args}"
  fi

  echo "$command"
}
