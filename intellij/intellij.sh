#!/bin/bash

sudo chown -R $PUID:$GUID /home/novnc/.idea
sudo chown $PUID:$GUID "$IDEAU_HOME/bin/idea.sh"
sudo chmod +x "$IDEAU_HOME/bin/idea.sh"

eval $(ssh-agent)

if [ -d /home/novnc/.ssh/ ]; then
  sudo chown -R $PUID:$GUID "/home/novnc/.ssh"
fi

if [ -f /home/novnc/.ssh/id_rsa ]; then
  ssh-add /home/novnc/.ssh/id_rsa
  sudo chown -R $PUID:$GUID "/home/novnc/.ssh"
fi

set -- sh "$IDEAU_HOME/bin/idea.sh" "$@"
exec "$@"
