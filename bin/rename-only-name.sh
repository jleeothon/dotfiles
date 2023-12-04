#!/usr/bin/env bash

# Parameters <filePath> <newName>
# Renames a file, keeping its location, the new name does not include location

set -eux

DIR="$(dirname "$1")"
NEW_NAME="$2"

mv "$1" "$DIR/$NEW_NAME"
