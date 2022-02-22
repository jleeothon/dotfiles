#!/usr/bin/env bash

set -eux

DOTTEMP=$(mktemp -d)
git clone git@github.com:jleeothon/dotfiles.git "$DOTTEMP"
rm -rf "$HOME/.git" || true
mv -f "$DOTTEMP/.git" "$HOME/.git"
# git --git-dir="$HOME/.git" reset --hard @{upstream}
