#!/bin/bash

set -x

# add user "novnc" to primary group "users" (will remove any other group membership)
addgroup -g 1001 sudo
addgroup -g 1002 users

addgroup -g "$GUID" novnc

# setup env for user novnc
mkdir -p '/home/novnc'
adduser -D -G novnc -u "$PUID" -s /bin/bash --home /home/novnc novnc

# add user "novnc" to secondary group "novnc" (will retain primary membership)
adduser novnc novnc
adduser novnc users
adduser novnc sudo
adduser novnc video
adduser novnc input

chown novnc:novnc /home/novnc

# change permission of folders
chown -R root:users /tmp/
chown -R root:users /var/
chown -R root:users /etc/

echo "$TZ" > /etc/timezone

chmod 0775 /etc/timezone
chmod 0775 /etc/localtime

# set shell for user novnc
export HOME=/home/novnc

mkdir -p $HOME/lib/perl5
export PERL5LIB=${HOME}/lib/perl5
export PERL_MM_OPT="INSTALL_BASE=${PERL5LIB}"

# setup ls++
curl -L https://cpanmin.us | perl - --sudo App::cpanminus
cpanm Term::ExtendedColor File::LsColor
cpan Term::ExtendedColor File::LsColor
git clone https://github.com/forkkit/ls--.git
cd ls--
perl Makefile.PL
make
make install
cd -
rm -rf ls--

# setup sudo permissions
echo "novnc ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
echo "%novnc ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
echo "%users ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
echo "%wheel ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
echo "1000 ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
echo "%1000 ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \

# setup NOVNC
git clone --depth 1 https://github.com/novnc/noVNC.git $HOME/noVNC && \
git clone --depth 1 https://github.com/novnc/websockify $HOME/noVNC/utils/websockify && \
rm -rf $HOME/noVNC/.git && \
rm -rf $HOME/noVNC/utils/websockify/.git && \
sed -i -- "s/ps -p/ps -o pid | grep/g" $HOME/noVNC/utils/novnc_proxy

# setup guacamole
sudo -H -u novnc mkdir -p /home/novnc/guacamole

# setup tomcat
sudo -H -u novnc mkdir -p /home/novnc/tomcat
sudo -H -u novnc wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.64/bin/apache-tomcat-9.0.64.tar.gz -O /home/novnc/apache-tomcat-9.0.64.tar.gz

if [ -f /home/novnc/apache-tomcat-9.0.64.tar.gz ]; then
  sudo -H -u novnc tar xvzf /home/novnc/apache-tomcat-9.0.64.tar.gz --strip-components 1 --directory /home/novnc/tomcat/
  rm -rf apache-tomcat-9.0.64.tar.gz
  chmod +x /home/novnc/tomcat/bin/*.sh
  mkdir -p /home/novnc/tomcat/webapps
else
  echo "Failed to download tomcat, please investigate"
  exit 1;
fi

# setup guacamole-client
# --> we will place a predownloaded war from: wget https://dlcdn.apache.org/guacamole/1.4.0/binary/guacamole-1.4.0.war -O /opt/tomcat/webapps/guacamole.war
export PATH="/home/novnc/tomcat/bin:$PATH"

rc-update add sshd
#rc-service xrdp start
#rc-service xrdp-sesman start
#rc-service vino start

set +x
