#!/bin/bash

# setup env for user nobody
mkdir -p '/home/nobody'
chown -R nobody:users '/home/nobody'
chmod -R 775 '/home/nobody'

# add user "nobody" to primary group "users" (will remove any other group membership)
addgroup -g "$GUID" nobody

adduser -G users -u "$PUID" -s /bin/bash --home /home/nobody nobody

# add user "nobody" to secondary group "nobody" (will retain primary membership)
addgroup nobody nobody
addgroup nobody users

# set shell for user nobody
export HOME=/home/nobody
