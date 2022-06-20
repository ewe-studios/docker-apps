FROM influx6/novnc-light:latest
MAINTAINER "Alexander Ewetumo <alex.ewetumo@gmail.com>"

# additional files
##################


# install app
#############
RUN \
    # install needed packages
    apk --no-cache --update --upgrade add \
      tzdata shadow libgcrypt linux-pam binutils gdb musl strace \
      bash bash-doc man-db man-pages less less-doc bash-completion \
      coreutils libxml2 libarchive python3 nodejs sqlite mariadb-client \
      font-noto ttf-dejavu ttf-liberation dunst hsetroot compton \
      file \
      lftp \
      tree \
      grep \
      vim nano make\
      git


EXPOSE 5900
EXPOSE 6080

# run script to set uid, gid and permissions
CMD ["/entrypoint.sh"]
