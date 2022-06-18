FROM influx6/novnc:latest
MAINTAINER "Alexander Ewetumo <alex.ewetumo@gmail.com>"

RUN set -ex && \
    apk --no-cache --update add libxtst libxrender \
    cmake g++ gcc gcc-objc llvm libpthread-stubs \
    gradle tk groovy scala kotlin openjdk8 openjdk11 rust rustup midori && \
    # Install IntelliJ Ultimate
    cd $HOME && \
    wget https://download-cdn.jetbrains.com/idea/ideaIU-2022.1.2.tar.gz && \
    tar -xf ideaIU-2022.1.2.tar.gz && \
    rm ideaIU-2022.1.2.tar.gz

ADD 03-intellij.conf /etc/supervisord/
ADD intellij.sh $HOME/intellij.sh
ADD idea.properties $HOME/idea-IU-221.5787.30/bin/idea.properties
RUN chmod +x $HOME/intellij.sh && \
    mkdir -p $HOME/.idea/config && \
    mkdir -p $HOME/.idea/plugins && \
    mkdir -p $HOME/.idea/logs && \
    mkdir -p $HOME/.idea/system

# Install IntelliJ Community
#RUN set -ex && \
#        wget https://download-cf.jetbrains.com/idea/ideaIC-2020.3.1-no-jbr.tar.gz && \
#        tar -xf ideaIC-2020.3.1-no-jbr.tar.gz && \
#        rm ideaIC-2020.3.1-no-jbr.tar.gz


# Set additional environment variables
ENV JDK18 /usr/lib/jvm/java-1.8-openjdk
ENV JDK11 /usr/lib/jvm/java-11-openjdk
ENV IDEAU_HOME $HOME/idea-IU-221.5787.30
ENV IDEAU_BIN=$IDEAU_HOME/bin/idea.sh

ENV idea.config.path=$HOME/.idea/config
ENV idea.plugins.path=$HOME/.idea/plugins
ENV idea.system.path=$HOME/.idea/system
ENV idea.log.path=$HOME/.idea/logs

ENV JAVA_HOME $JDK18
ENV JDK_HOME  $JDK18
ENV JAVA_EXE  $JDK18/bin/java

ENV PYCHARM_JDK $JDK11
ENV IDEA_JDK $JDK11

# run script to set uid, gid and permissions
CMD ["/entrypoint.sh"]
