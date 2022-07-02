FROM influx6/novnc-light:latest
MAINTAINER "Alexander Ewetumo <alex.ewetumo@gmail.com>"

# additional files
##################


# install app
#############
RUN \
    # install needed packages
    apk --no-cache --update --upgrade add \
      shadow libgcrypt linux-pam binutils gdb musl strace \
      bash-doc man-db man-pages less less-doc bash-completion \
      coreutils libxml2 libarchive python3 nodejs sqlite mariadb-client \
      lftp dropbear util-linux pciutils usbutils coreutils binutils findutils grep iproute2 \
      make google-authenticator openssh-server-pam \
      git && \
      pip install websockify pxdg numpy


EXPOSE 5900
EXPOSE 6080

# run script to set uid, gid and permissions
CMD ["/entrypoint.sh"]
