#!/opt/homebrew/bin/bash
LOGS_FILE="$HOME/logs/delete-empty-folder-recursive.log"
mkdir -p "$(dirname "$LOGS_FILE")"
exec >> "$LOGS_FILE" 2>&1

set -eux
shopt -s globstar

# Input is a folder
if [ ! -d "$1" ]
then
	echo "'$1' is not a folder"
	exit 1
fi

for file in "$1"/**/*
do
	if [ ! -d "$file" ]
	then
		continue
	fi
	rmdir -p "$file" || true
done
