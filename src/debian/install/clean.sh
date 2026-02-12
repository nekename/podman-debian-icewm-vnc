#!/usr/bin/env bash
set -e

echo "Cleaning package cache..."
apt-get clean -y
echo "Removing unneeded packages..."
apt-get autoremove --purge -y
