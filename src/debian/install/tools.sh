#!/usr/bin/env bash
set -e

echo "Installing common tools..."
apt-get install -y alacritty nano wget procps
apt-get clean -y
echo "Successfully installed common tools"
