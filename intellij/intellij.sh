#!/bin/bash

sudo chown -R $PUID:$GUID /home/nobody/.idea
sudo chown  $PUID:$GUID /home/nobody/Lab

sh "$IDEAU_HOME/bin/idea.sh"

