# Dotfiles

Johnny's dotfiles.

## How it works

- Makes a `git` repo out of the home folder. CRAZY, RIGHT? So far so good.
- Files are not tracked unless added to `.gitignore`.
- Some files are kept "private" e.g. `.private.gitconfig` and synced with Dropbox.

## Installing

```sh
DOTTEMP=$(mktemp -d) && \
git clone git@gitlab.com:jleeothon/dotfiles.git "$DOTTEMP" && \
rm -rf "$HOME/.git" && \
mv -f "$DOTTEMP/.git" "$HOME/.git" && \
git --git-dir="$HOME/.git" reset --hard @{upstream}
```
