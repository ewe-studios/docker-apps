FROM influx6/novnc-light:latest
MAINTAINER "Alexander Ewetumo <alex.ewetumo@gmail.com>"

# additional files
##################


# install app
#############
RUN \
    # install needed packages
    apk --no-cache --update --upgrade add \
      shadow libgcrypt linux-pam binutils gdb musl strace libc6-compat  \
      bash-doc man-db man-pages less less-doc bash-completion \
      coreutils libxml2 libarchive python3 py3-pip nodejs sqlite mariadb-client \
      e2fsprogs-libs llvm libpthread-stubs  automake gfortran subversion python3-dev \
      libxtst libxrender perl-digest-md5 lua-md5 python3-dev py3-pip \
      mpc1 mpfr4 musl-dev git curl build-base autoconf automake py3-cryptography xkill \
      linux-headers musl-dev libffi-dev openssl-dev openssh py-virtualenv \
      cmake g++ gcc gcc-objc e2fsprogs e2fsprogs-extra \
      e2fsprogs-libs libpthread-stubs  automake gfortran subversion python3-dev \
      gradle tk openjdk11 rustup midori \
      lftp dropbear util-linux pciutils usbutils coreutils binutils findutils grep iproute2 \
      make google-authenticator openssh-server-pam git && \
      mkdir -p $HOME/.cache/pip && \
      chown -R novnc:novnc $HOME/.cache && \
      sudo -H -u novnc pip install websockify pyxdg numpy && \
      sudo -H -u novnc sh /home/novnc/rust.sh && \
      sh /home/novnc/user.sh


EXPOSE 5900
EXPOSE 6080

# run script to set uid, gid and permissions
CMD ["/entrypoint.sh"]
