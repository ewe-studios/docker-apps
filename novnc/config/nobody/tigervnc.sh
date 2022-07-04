#!/bin/bash

rm -rf /tmp/.X*;

# setup env for user nobody
OTHER_ARGS="-SecurityTypes=${SECURITY_TYPE}"

if [ -f "/home/novnc/.vnc/passwd" ]; then
  OTHER_ARGS="-PasswordFile /home/novnc/.vnc/passwd"
fi

command="Xvnc ${DISPLAY} -geometry ${DISPLAY_WIDTH}x${DISPLAY_HEIGHT} -depth ${DISPLAY_DEPTH} ${OTHER_ARGS} --X509Cert /home/novnc/ssl/server.crt --X509Key /home/novnc/ssl/server.key"
if [ "${DISPLAY_MAX}" = "1" ]; then
  command="Xvnc ${DISPLAY} -geometry ${DISPLAY_WIDTH_MAX}x${DISPLAY_HEIGHT_MAX} -depth ${DISPLAY_DEPTH} ${OTHER_ARGS}"
elif [ "${DISPLAY_MAX}" = "-1" ]; then
  command="Xvnc ${DISPLAY} -depth ${DISPLAY_DEPTH} ${OTHER_ARGS}"
fi

echo "executing command: ${command}";

# start tigervnc clipboard manager
#vncconfig -nowin &

# start tigervnc itself
eval "${command}"
