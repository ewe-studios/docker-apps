# NoVNC
Docker image for creating a simple, slim GUI for running application. We encourage customization of the `supervisord.conf`
for custom changes that allow you to run via VNC easily.

### Base Image

- [Alpine:Edge](https://hub.docker.com/_/alpine)

### Depends on

- [NoVNC](https://github.com/novnc/noVNC)
- [TigerVNC](https://github.com/TigerVNC/tigervnc)

### Images

Two images are created:

1. influx6/novnc - regular vnc image with more base packages
2. influx6/novnc-light - a lighter version with just vnc packages

### Description

Run any application with a UI in docker and connect via browser.

Please replace all user variables in the above command defined by <> with the correct values.

**Example**
```
docker run -d \
    -p 5900:5900 \
    -p 6080:6080 \
    -p 7080:7080 \
    --name=novnc \
    -v ./config:/home/nobody/.idea \
    -e DISPLAY_WIDTH=<> \
    -e DISPLAY_HEIGHT=<> \
    -e DISPLAY_DEPTH=<> \
    -e VNC_SERVER=<x11 or tigervnc> (default: tigervnc) \
    -e VNC_PASSWORD=mypassword \
    -e GUACA_PASSWORD=mypassword \
    influx6/novnc:latest
```


## Guacamole Client

Installed with the VNC client is a guacamole client and server which can act as a better alternative to raw NoVNC web app for
accessing your service.

Simply navigate to: http://localhost:7080/guacamole

Default username and password are: novnc (password can be customized via environment variables `GUACA_PASSWORD`)

![img.png](img.png)

## NoVNC Web App

**Access via web interface (noVNC)**

`http://<host ip>:<host port>/vnc.html?resize=remote&host=<host ip>&port=<host port>&&autoconnect=1`

e.g.:-

`http://192.168.1.10:6080/vnc.html?resize=remote&host=192.168.1.10&port=6080&&autoconnect=1`

**Access via VNC client**

`<host ip>::<host port>`

e.g.:-

`192.168.1.10::5900`

**Usage**
```
docker run -d \
    -p 5900:5900 \
    -p 6080:6080 \
    -p 7080:7080 \
    --name=<container name> \
    influx6/novnc:latest
```

To add another application, write your own docker file:

```docker-file
FROM influx6/novnc:latest
RUN \
    # Install xterm
    apk add xterm && \
    # Append xterm entry to supervisord.conf
    cd /etc/supervisord/ && \
    echo '[program:xterm]' > 03-myapp.conf && \
    echo 'command=xterm' >> 03-myapp.conf && \
    echo 'autorestart=true' >> 03-myapp.conf
```

**Notes**

User ID (PUID) and Group ID (PGID) can be found by issuing the following command for the user you want to run the container as:-

```
id <username>
```

## Environment Variables

These are environment variables which can be customized as you see fit


```bash
DISPLAY= - display you wish to use (default is :0)

GUID - override GUID to match your external user groupd id

PUID - override PUID to match your external user id

TERM=xterm  - default terminal

LANG=en_US.UTF-8 

LANGUAGE=en_US.UTF-8 

LC_ALL=C.UTF-8 

TZ=Asia/Hong_Kong 

SECURITY_TYPE=None - security type for vnc and guacamole (can affect guacamole connectivity)

VNC_SERVER=tigervnc/x11

DISPLAY_DEPTH=24 

DISPLAY_WIDTH=1280 

DISPLAY_HEIGHT=1024 

DISPLAY_MAX=0/1/-1 - selects between 0 - default display size, 1 - max display size or -1 - auto display settings 

DISPLAY_WIDTH_MAX=1600  - max display width

DISPLAY_HEIGHT_MAX=1200  - max display height

LANG=en_GB.UTF-8 

GUACA_PASSWORD=novnc - password for guacamole ui login for user novnc

GUACA_SSL=true  - enable ssl mode for guacd

VNC_PASSWORD=novnc - password for vnc

TIGER_VNC_OPTS - add extra options to tiger vnc when VNC_SERVER=tiger

X11_VNC_OPTS - add extra options to x11vnc when VNC_SERVER=X11
```