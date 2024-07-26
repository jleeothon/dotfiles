#!/usr/env/bin bash

set -eux

LOGS_FILE="$HOME/.logs.flatten-folder.log"
exec > "$LOGS_FILE" 2>&1

# find "$1" -type f -exec mv {} "$1" \;
FOLDER_NAME="$1"
find "$FOLDER_NAME" -mindepth 2 -type f -exec mv "$FOLDER_NAME" {} +
