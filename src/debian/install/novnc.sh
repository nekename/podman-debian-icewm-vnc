#!/usr/bin/env bash
set -eu

echo "Installing noVNC..."
apt-get install -y novnc websockify
apt-get clean -y
echo "Successfully installed noVNC"
