#!/usr/bin/env bash
set -euxo pipefail
sudo kill -9 "$(ps ax | grep 'coreaudio[a-z]' | awk '{print $1}')"
