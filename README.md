# Dotfiles

Johnny's dotfiles.

## Features

- Makes a `git` repo out of your home folder. So far so good.
- No other installation needed.
- Files are not tracked unless added to `.gitignore`.
- Some files are kept private e.g. `.private.gitconfig`. They could be saved separately by making soft links to e.g. `$HOME/Dropbox/.my.private.file`.

### List of private files

This list is just for reference, so I remember what I will have to manually link again.

- `.private.gitconfig`
- `.private.zsh`

## Installing

```
DOTTEMP=$(mktemp -d) && git clone git@gitlab.com:jleeothon/dotfiles.git "$DOTTEMP" && rm -rf "$HOME/.git" && mv -f "$DOTTEMP/.git" "$HOME/.git" && git --git-dir="$HOME/.git" reset --hard @{upstream}
```

## Other

Sometimes I may accidentally commit something I shouldn't, then I will rewrite history.
