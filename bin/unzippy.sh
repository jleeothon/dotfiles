#!/usr/bin/env zsh

# requires brew install trash

set -euxo pipefail

arg="$1"

if ! test -f "$arg"
then
	echo "Not a regular file" "$arg"
	exit 1
fi
if test "$(file --mime-type --brief "$arg")" != application/zip
then
	echo "Not a zip file" "$arg"
	exit 1
fi

pushd "$(dirname "$arg")"
newFolderName="$(basename "$arg" .zip)"
unzip "$arg" -d "$newFolderName"

pushd "$newFolderName"
if test "$(ls | wc -l)" -eq 1 && test -d "$(ls)"
then
	loneFolder="$(ls)"
  mv "$loneFolder"/* ./
	rmdir "$loneFolder" || /opt/homebrew/bin/trash -v "$loneFolder"
fi

popd
popd

/opt/homebrew/bin/trash -v "$arg"
