FROM debian:13

ENV DISPLAY=:1 \
    VNC_PORT=5901 \
    NO_VNC_PORT=6901
EXPOSE $VNC_PORT $NO_VNC_PORT

ENV HOME=/headless \
    SHELL=/bin/bash \
    TERM=alacritty \
    INSTALL_DIR=/install \
    STARTUP_DIR=/startup \
    DEBIAN_FRONTEND=noninteractive \
    VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=1280x1024 \
    VNC_PASSWORD=vncpassword \
    VNC_PASSWORDLESS=false
WORKDIR $HOME

ADD ./src/common/install $INSTALL_DIR
ADD ./src/debian/install $INSTALL_DIR
ADD ./src/common/home $HOME
ADD ./src/common/startup $STARTUP_DIR

RUN $INSTALL_DIR/update.sh

RUN $INSTALL_DIR/tools.sh

RUN $INSTALL_DIR/icewm.sh

RUN $INSTALL_DIR/firefox.sh
RUN $INSTALL_DIR/chromium.sh

RUN $INSTALL_DIR/tigervnc.sh
RUN $INSTALL_DIR/novnc.sh

RUN $INSTALL_DIR/clean.sh

RUN $INSTALL_DIR/set_user_permission.sh $STARTUP_DIR $HOME
USER 1000

ENTRYPOINT ["/startup/startup.sh"]
