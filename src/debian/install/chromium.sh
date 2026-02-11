#!/usr/bin/env bash
set -e

echo "Installing Chromium..."
apt-get install -y chromium
apt-get clean -y
echo "Successfully installed Chromium"
