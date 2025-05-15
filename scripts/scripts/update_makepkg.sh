#!/bin/bash

# Path to the config file
CONFIG_FILE="/etc/makepkg.conf"

# Check if script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "Please run as root (use sudo)."
    exit 1
fi

# Backup the original file
cp "$CONFIG_FILE" "${CONFIG_FILE}.bak"

# Modify the MAKEFLAGS line
sed -i 's/^#\?\s*MAKEFLAGS=".*"/MAKEFLAGS="-j'"$(nproc)"'"/' "$CONFIG_FILE"

echo "MAKEFLAGS updated to use -j$(nproc). Backup saved as ${CONFIG_FILE}.bak"

