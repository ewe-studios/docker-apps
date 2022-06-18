FROM alpine:edge
MAINTAINER "Alexander Ewetumo <alex.ewetumo@gmail.com>"

# additional files
##################

# Setup environment variables
ENV DISPLAY=:0.0 \
    GUID=1000 \
    HOME=/home/nobody \
    PUID=1000 \
    TERM=xterm \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    HOME=/home/nobody \
    TZ=Asia/Hong_Kong \
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


# add pre-configured config files for deluge
ADD config/nobody/ /home/nobody/
ADD styles /home/nobody/.flux/styles
ADD config/supervisord /etc/supervisord
ADD config/supervisord.conf /etc/supervisord.conf
ADD entrypoint.sh /entrypoint.sh

# install app
#############
RUN \
    # add directories
    mkdir -p /home/nobody && \
    mkdir -p /home/.fluxbox/styles && \
    mkdir -p /var/logs/supervisord/ && \
    # Install required packages \
    chmod +x /entrypoint.sh && \
    chmod +x /home/nobody/*.sh && \
    sh /home/nobody/install.sh && \
    echo "http://dl-3.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --no-cache --update --upgrade add \
      tzdata shadow libgcrypt linux-pam binutils gdb musl strace \
      bash bash-doc man-db man-pages less less-doc bash-completion \
      coreutils libxml2 libarchive python3 nodejs sqlite mariadb-client \
      font-noto ttf-dejavu ttf-liberation dunst hsetroot compton \
      file \
      lftp \
      tree \
      grep \
      sudo \
      vim nano make\
      fluxbox \
      git \
      xterm \
      tigervnc \
      openssl openssl-dev \
      supervisor \
      curl axel \
      zip unzip tar xz \
      xvfb \
      xvfb-run \
      x11vnc \
      && \
    # Install noVNC \
    git clone --depth 1 https://github.com/novnc/noVNC.git $HOME/noVNC && \
    git clone --depth 1 https://github.com/novnc/websockify $HOME/noVNC/utils/websockify && \
    echo "nobody ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/nobody && \
    ln -sf python3 /usr/bin/python && \
    python3 -m ensurepip && \
    rm -rf $HOME/noVNC/.git && \
    rm -rf $HOME/noVNC/utils/websockify/.git && \
    sed -i -- "s/ps -p/ps -o pid | grep/g" $HOME/noVNC/utils/novnc_proxy


EXPOSE 5900
EXPOSE 6080

WORKDIR /home/nobody

# Setup environment variables
ENV DISPLAY=:0.0 \
    TERM=xterm \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    HOME=/home/nobody \
    TZ=Asia/Hong_Kong \
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
