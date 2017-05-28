# Dotfiles

Johnny's dotfiles.

## Features

- Makes a `git` repo out of your home folder. So far so good.
- No other installation needed.
- Files are not tracked unless added to `.gitignore`.
- Some files are kept "private" e.g. `.private.gitconfig`. They are synced with Dropbox instead.

## Installing

```
DOTTEMP=$(mktemp -d) && git clone git@gitlab.com:jleeothon/dotfiles.git "$DOTTEMP" && rm -rf "$HOME/.git" && mv -f "$DOTTEMP/.git" "$HOME/.git" && git --git-dir="$HOME/.git" reset --hard @{upstream}
```

## Other

Sometimes I may accidentally commit something I shouldn't, then I will rewrite history.
