#!/bin/bash

# add user "nobody" to primary group "users" (will remove any other group membership)
addgroup -g "$GUID" nobody

# setup env for user nobody
mkdir -p '/home/nobody'
chown -R nobody:nobody '/home/nobody'
chmod -R 775 '/home/nobody'

adduser -G users -u "$PUID" -s /bin/bash --home /home/nobody nobody

# add user "nobody" to secondary group "nobody" (will retain primary membership)
addgroup nobody nobody
addgroup nobody users
addgroup sudo users

# change permission of folders
chown -R root:users /tmp/
chown -R root:users /var/
chown -R root:users /etc/
chmod 0775 /etc/timezone
chmod 0775 /etc/localtime

# set shell for user nobody
export HOME=/home/nobody
