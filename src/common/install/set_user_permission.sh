#!/usr/bin/env bash
set -e

for var in "$@"; do
    echo "Fixing permissions for $var..."
    find "$var"/ -name '*.sh' -exec chmod a+x {} +
    find "$var"/ -name '*.desktop' -exec chmod a+x {} +
    chgrp -R 0 "$var" && chmod -R a+rw "$var" && find "$var" -type d -exec chmod a+x {} +
done
