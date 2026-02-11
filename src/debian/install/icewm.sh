#!/usr/bin/env bash
set -e

echo "Installing IceWM..."
apt-get install -y xorg xinit icewm
apt-get clean -y
echo "Successfully installed IceWM"
