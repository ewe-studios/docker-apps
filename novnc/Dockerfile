FROM alpine:edge
MAINTAINER "Alexander Ewetumo <alex.ewetumo@gmail.com>"

# additional files
##################

ENV GUID=1000 \
    HOME=/home/nobody \
    PUID=100

# add install and packer bash script
RUN mkdir -p /home/nobody && \
    mkdir -p /var/logs/supervisord/

# add pre-configured config files for deluge
ADD config/nobody/ /home/nobody/
ADD config/supervisord /etc/supervisord
ADD config/supervisord.conf /etc/supervisord.conf
ADD entrypoint.sh /entrypoint.sh

# install app
#############
RUN \
    # Install required packages \
    chmod +x /entrypoint.sh && \
    chmod +x /home/nobody/*.sh && \
    sh /home/nobody/install.sh && \
    echo "http://dl-3.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --update --upgrade add \
      bash bash-doc man-db man-pages less less-doc \
      bash-completion \
      coreutils \
      shadow \
      font-noto \
      file \
      bin-utils gdb musl-db strace \
      grep \
      sudo gksudo \
      vim nano \
      fluxbox \
      git \
      xterm \
      tint2 \
      tigervnc \
      openssl-dev \
      supervisor \
      curl axel \
      zip unzip tar xz \
      xvfb \
      xvfb-run \
      x11vnc \
      && \
    # Install noVNC
    git clone --depth 1 https://github.com/novnc/noVNC.git $HOME/noVNC && \
    git clone --depth 1 https://github.com/novnc/websockify $HOME/noVNC/utils/websockify && \
    rm -rf $HOME/noVNC/.git && \
    rm -rf $HOME/noVNC/utils/websockify/.git && \
    apk del git && \
    sed -i -- "s/ps -p/ps -o pid | grep/g" $HOME/noVNC/utils/novnc_proxy

EXPOSE 5900
EXPOSE 6080

# Setup environment variables
ENV DISPLAY=:0.0 \
    TERM=xterm \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    HOME=/home/nobody \
    DEBIAN_FRONTEND=noninteractive \
    SECURITY_TYPE=None \
    VNC_SERVER=tigervnc \
    DISPLAY_DEPTH=24 \
    DISPLAY_WIDTH=1280 \
    DISPLAY_HEIGHT=1024 \
    DISPLAY_MAX=0 \
    DISPLAY_WIDTH_MAX=1600 \
    DISPLAY_HEIGHT_MAX=1200 \
    LANG=en_GB.UTF-8 \
    VNC_PASSWORD=nobody

# run script to set uid, gid and permissions
CMD ["/entrypoint.sh"]
