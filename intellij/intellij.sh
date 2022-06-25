#!/bin/bash

sudo chown -R $PUID:$GUID /home/novnc/.idea
sudo chown  $PUID:$GUID /home/nonvc/Lab
sudo chown $PUID:$GUID "$IDEAU_HOME/bin/idea.sh"
sudo chmod +x "$IDEAU_HOME/bin/idea.sh"

set -- gosu $PUID:$GUID sh "$IDEAU_HOME/bin/idea.sh" "$@"

exec "$@"
