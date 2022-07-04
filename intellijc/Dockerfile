FROM influx6/novnc:latest
MAINTAINER "Alexander Ewetumo <alex.ewetumo@gmail.com>"

ENV HOME /home/novnc

RUN set -ex && \
    apk --no-cache --update COPY midori

RUN set -ex && \
    # Install IntelliJ Ultimate
    cd $HOME && \
    sudo -H -u novnc wget https://download.jetbrains.com/idea/ideaIC-2022.1.3.tar.gz && \
    sudo -H -u novnc tar -xf ideaIC-2022.1.3.tar.gz && \
    rm ideaIC-2022.1.3.tar.gz && \
    sudo -H -u novnc mkdir -p $HOME/.idea/config && \
    sudo -H -u novnc mkdir -p $HOME/.idea/plugins && \
    sudo -H -u novnc mkdir -p $HOME/.idea/logs && \
    sudo -H -u novnc mkdir -p $HOME/.idea/system

# Install IntelliJ Community
#RUN set -ex && \

ENV NVC_HOME /home/novnc

# COPY our properties files
COPY --chown=novnc:novnc 03-intellij.conf /etc/supervisord/
COPY --chown=novnc:novnc intellij.sh $NVC_HOME/intellij.sh
COPY --chown=novnc:novnc idea.properties $NVC_HOME/idea-IC-221.5921.22/bin/idea.properties
COPY --chown=novnc:novnc idea.properties $NVC_HOME/.idea.properties

# Set COPYitional environment variables
ENV JDK18=/usr/lib/jvm/java-11-openjdk \
    JDK11=/usr/lib/jvm/java-11-openjdk \
    IDEAU_HOME=$NVC_HOME/idea-IC-221.5921.22 \
    IDEAU_BIN=$NVC_HOME/idea-IC-221.5921.22/bin/idea.sh \
    JAVA_HOME=/usr/lib/jvm/java-11-openjdk \
    JDK_HOME=/usr/lib/jvm/java-11-openjdk \
    JAVA_EXE=/usr/lib/jvm/java-11-openjdk/bin/java \
    PYCHARM_JDK=/usr/lib/jvm/java-11-openjdk \
    IDEA_JDK=/usr/lib/jvm/java-11-openjdk \
    IDEA_PROPERTIES=$NVC_HOME/.idea.properties \
    CLION_PROPERTIES=$NVC_HOME/.idea.properties \
    APPCODE_PROPERTIES=$NVC_HOME/.idea.properties \
    PYCHARM_PROPERTIES=$NVC_HOME/.idea.properties \
    DATAGRIP_PROPERTIES=$NVC_HOME/.idea.properties \
    STUDIO_PROPERTIES=$NVC_HOME/.idea.properties \
    WEBIDE_PROPERTIES=$NVC_HOME/.idea.properties \
    PHPSTORM_PROPERTIES=$NVC_HOME/.idea.properties \
    GOLAND_PROPERTIES=$NVC_HOME/.idea.properties \
    RIDER_PROPERTIES=$NVC_HOME/.idea.properties \
    PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"

RUN chmod +x $NVC_HOME/intellij.sh && \
    chown -R novnc:novnc $NVC_HOME/intellij.sh && \
    chown -R novnc:novnc $NVC_HOME/idea-IC-221.5921.22/bin/idea.properties && \
    chown -R novnc:novnc $NVC_HOME/.idea.properties && \
    echo "fs.inotify.max_user_watches = 524288" >> /etc/sysctl.conf

VOLUME ["/home/novnc/.idea"]

USER novnc

# run script to set uid, gid and permissions
CMD ["/entrypoint.sh"]
