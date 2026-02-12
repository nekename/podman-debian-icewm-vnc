#!/usr/bin/env bash
set -e

echo "Installing TigerVNC server..."
apt-get install -y tigervnc-standalone-server
printf '$localhost = "no";\n1;\n' >>/etc/tigervnc/vncserver-config-defaults
echo "Successfully installed TigerVNC server"
