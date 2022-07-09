FROM influx6/novnc:latest
MAINTAINER "Alexander Ewetumo <alex.ewetumo@gmail.com>"

ARG INTELLIJ_VERSION=2022.1.3
ENV HOME /home/novnc

RUN set -ex && \
    mkdir -p /home/novnc/ideau && \
    apk --no-cache --update add midori

RUN set -ex && \
    # Install IntelliJ Ultimate
    cd $HOME && \
    sudo -H -u novnc wget https://download-cdn.jetbrains.com/idea/ideaIU-${INTELLIJ_VERSION}.tar.gz && \
    sudo -H -u novnc tar -xvzf ideaIU-${INTELLIJ_VERSION}.tar.gz --strip-components 1 --directory /home/novnc/ideau/ && \
    rm ideaIU-2022.1.2.tar.gz

ENV NVC_HOME /home/novnc

# Add our properties files
COPY --chown=novnc:novnc ./idea/ $NVC_HOME/.idea/
COPY --chown=novnc:novnc 03-intellij.conf /etc/supervisord/
COPY --chown=novnc:novnc intellij.sh $NVC_HOME/intellij.sh
COPY --chown=novnc:novnc idea.properties $NVC_HOME/ideau/bin/idea.properties
COPY --chown=novnc:novnc idea.properties $NVC_HOME/.idea.properties
COPY --chown=novnc:novnc licenses $NVC_HOME/licenses

# Set additional environment variables
ENV JDK18=/usr/lib/jvm/java-11-openjdk \
    JDK11=/usr/lib/jvm/java-11-openjdk \
    IDEAU_HOME=$NVC_HOME/ideau \
    IDEAU_BIN=$NVC_HOME/ideau/bin/idea.sh \
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
    chown novnc:novnc -R /home/novnc/Lab && \
    chown novnc:novnc -R /home/novnc/.idea && \
    chown novnc:novnc -R /home/novnc/.java && \
    echo "fs.inotify.max_user_watches = 524288" >> /etc/sysctl.conf

VOLUME ["/home/novnc/.idea"]

USER novnc

# run script to set uid, gid and permissions
CMD ["/entrypoint.sh"]
