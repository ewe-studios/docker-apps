#!/bin/bash

sudo chown -R $PUID:$GUID /home/novnc/.idea
sudo chown $PUID:$GUID "$IDEAU_HOME/bin/idea.sh"
sudo chmod +x "$IDEAU_HOME/bin/idea.sh"

set -- gosu novnc sh "$IDEAU_HOME/bin/idea.sh" "$@"
#set -- sh "$IDEAU_HOME/bin/idea.sh" "$@"

exec "$@"
