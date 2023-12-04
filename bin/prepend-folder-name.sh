#!/opt/homebrew/bin/bash
LOGS_FILE="$HOME/logs/prepend-folder-name.log"
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


# # Print files separated by null character, then read them separated by null character
# find "$1" -type f -print0 | while IFS= read -r -d '' file
# do
# done

for file in "$1"/**/*
do
	FOLDER_PATH=$(dirname "$file")
	PREFIX="$(basename "$FOLDER_PATH") - "
	OLD_NAME=$(basename "$file")
	if [ ! -f "$file" ]
	then
		echo "Skipped non-regular file: $file"
		continue
	fi
  if [[ "$OLD_NAME" == "$PREFIX"* ]]
	then
		echo "Skipped already prefixed file: $file"
		continue
	fi
	NEW_NAME="$PREFIX""$OLD_NAME"
	mv "$file" "$FOLDER_PATH"/"$NEW_NAME"
done
