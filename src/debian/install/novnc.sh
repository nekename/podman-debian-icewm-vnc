#!/usr/bin/env bash
set -eu

echo "Installing noVNC..."
apt-get install -y novnc websockify
echo "Successfully installed noVNC"
