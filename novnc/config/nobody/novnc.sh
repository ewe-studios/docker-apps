#!/bin/bash

set -x

enabled="$1";
novnc_enabled="$2";
vnc_addr="$3";
vnc_port="$4";
web_port="$5";

shift;
shift;
shift;
shift;
shift;
shift;

hostname="${NOVNC_HOSTNAME}";
HOSTNAME="${NOVNC_HOSTNAME}";

if [ "$novnc_enabled" = "1" ]; then
  if [ "$enabled" = "1" ]; then
    /home/novnc/noVNC/utils/novnc_proxy \
      --cert /home/novnc/ssl/server.crt \
      --key /home/novnc/ssl/server.key \
      --heartbeat 2 \
      --vnc "$vnc_addr:$vnc_port" \
      --listen "$web_port" \
      "$@"
  fi
fi

set +x