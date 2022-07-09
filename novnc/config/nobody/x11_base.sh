#!/bin/bash

rm -rf /tmp/.X*;
rm -rf /var/tmp/.X*;

create_screen() {
  display="$1";
  screen="$2";
  size="$3";
  opts="$4";

  # setup env for user nobody
  echo "Xvfb ${display} -noreset -screen ${screen} ${size} ${opts}"
}
