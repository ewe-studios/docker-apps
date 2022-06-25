FROM influx6/novnc:latest
MAINTAINER "Alexander Ewetumo <alex.ewetumo@gmail.com>"

ENV HOME /home/novnc

RUN set -ex && \
    apk --no-cache --update add libxtst libxrender \
    cmake g++ gcc gcc-objc e2fsprogs e2fsprogs-extra \
    e2fsprogs-libs llvm libpthread-stubs \
    gradle tk openjdk8 openjdk11 rust rustup midori

RUN set -ex && \
    # Install IntelliJ Ultimate
    cd $HOME && \
    wget https://download-cdn.jetbrains.com/idea/ideaIU-2022.1.2.tar.gz && \
    tar -xf ideaIU-2022.1.2.tar.gz && \
    rm ideaIU-2022.1.2.tar.gz && \
    chmod +x $HOME/intellij.sh && \
    mkdir -p $HOME/.idea/config && \
    mkdir -p $HOME/.idea/plugins && \
    mkdir -p $HOME/.idea/logs && \
    mkdir -p $HOME/.idea/system

# Install IntelliJ Community
#RUN set -ex && \
#        wget https://download-cf.jetbrains.com/idea/ideaIC-2020.3.1-no-jbr.tar.gz && \
#        tar -xf ideaIC-2020.3.1-no-jbr.tar.gz && \
#        rm ideaIC-2020.3.1-no-jbr.tar.gz

# Add our properties files
ADD 03-intellij.conf /etc/supervisord/
ADD intellij.sh $HOME/intellij.sh
ADD licenses $HOME/licenses
ADD idea.properties $HOME/idea-IU-221.5787.30/bin/idea.properties

# Set additional environment variables
ENV JDK18=/usr/lib/jvm/java-1.8-openjdk \
    JDK11=/usr/lib/jvm/java-11-openjdk \
    IDEAU_HOME=$HOME/idea-IU-221.5787.30 \
    IDEAU_BIN=$HOME/idea-IU-221.5787.30/bin/idea.sh \
    JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk \
    JDK_HOME=/usr/lib/jvm/java-1.8-openjdk \
    JAVA_EXE=/usr/lib/jvm/java-1.8-openjdk/bin/java \
    PYCHARM_JDK=/usr/lib/jvm/java-11-openjdk \
    IDEA_JDK=/usr/lib/jvm/java-11-openjdk \
    PATH="/usr/lib/jvm/java-1.8-openjdk/bin/:$PATH"

VOLUME ["/home/novnc/.idea"]

# run script to set uid, gid and permissions
CMD ["/entrypoint.sh"]
