#!/usr/bin/env bash
set -e

cleanup() {
    kill -s SIGTERM $!
    exit 0
}
trap cleanup SIGINT SIGTERM
mkdir -p $STARTUP_DIR/logs

echo "Setting VNC password..."
mkdir -p "$HOME/.config/tigervnc"
PASSWD_PATH="$HOME/.config/tigervnc/passwd"
if [[ -f $PASSWD_PATH ]]; then
    echo "Purging existing VNC password settings..."
    rm -f $PASSWD_PATH
fi
echo "$VNC_PASSWORD" | vncpasswd -f >>$PASSWD_PATH
chmod 600 $PASSWD_PATH

echo "Starting noVNC..."
websockify --web=/usr/share/novnc/ $NO_VNC_PORT localhost:$VNC_PORT >$STARTUP_DIR/logs/novnc_startup.log 2>&1 &
PID_SUB=$!

echo "Cleaning up any existing VNC server instances..."
vncserver -kill $DISPLAY &>$STARTUP_DIR/logs/vnc_startup.log ||
    rm -rfv /tmp/.X*-lock /tmp/.X11-unix &>$STARTUP_DIR/logs/vnc_startup.log ||
    echo "No existing VNC server instances found."

echo "Starting VNC server... (VNC_COL_DEPTH: $VNC_COL_DEPTH, VNC_RESOLUTION: $VNC_RESOLUTION)"
vnc_cmd="vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION PasswordFile=$HOME/.config/tigervnc/passwd"
if [[ ${VNC_PASSWORDLESS:-} == "true" ]]; then
    vnc_cmd="${vnc_cmd} -SecurityTypes None --I-KNOW-THIS-IS-INSECURE"
fi
$vnc_cmd >$STARTUP_DIR/logs/vnc_startup.log 2>&1

echo "Starting IceWM..."
# Disable screensaver and power management
xset -dpms &
xset s noblank &
xset s off &
# Start IceWM
/usr/bin/icewm-session >$STARTUP_DIR/logs/wm_startup.log 2>&1 &

echo "Startup complete!"
wait $PID_SUB
