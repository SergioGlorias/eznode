#!/bin/bash
set -xeo pipefail

# inotify-tools needed to wait for the tor onion hostname file to appear
apt-get install -qqy --no-install-recommends tor inotify-tools

# Utilities for tor management and switching circuits
mv bin/* /ez/bin/

# Symlink onion service directory to mark it for backup
ln -s /data/tor-hsv /important/
