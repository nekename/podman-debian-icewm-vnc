#!/usr/bin/env bash
set -e

echo "Installing Firefox ESR..."
apt-get install -y firefox-esr
apt-get clean -y
echo "Successfully installed Firefox ESR"
