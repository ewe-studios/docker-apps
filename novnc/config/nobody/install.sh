#!/bin/bash

# add user "nobody" to primary group "users" (will remove any other group membership)
addgroup sudo
addgroup users
addgroup -g "$GUID" nobody

# setup env for user nobody
mkdir -p '/home/nobody'

adduser -G nobody -u "$PUID" -s /bin/bash --home /home/nobody nobody

# add user "nobody" to secondary group "nobody" (will retain primary membership)
adduser nobody nobody
adduser nobody users
adduser nobody sudo
adduser nobody video
adduser nobody input

# change permission of folders
chown -R root:users /tmp/
chown -R root:users /var/
chown -R root:users /etc/

echo "$TZ" > /etc/timezone

chmod 0775 /etc/timezone
chmod 0775 /etc/localtime

# set shell for user nobody
export HOME=/home/nobody
