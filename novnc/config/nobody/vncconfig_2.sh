#!/bin/bash

if [ "${ENABLE_SCREEN_2}" = "1" ]; then
  DISPLAY=:1
  vncconfig -v -connect "0.0.0.0:$DISPLAY_2_PORT"
fi