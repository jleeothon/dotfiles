# Dotfiles

```
DOTTEMP=$(mktemp -d) && git clone git@gitlab.com:jleeothon/dot.git "$DOTTEMP" && rm -rf "$HOME/.git" && mv -f "$DOTTEMP/.git" "$HOME/.git" && git --git-dir="$HOME/.git" reset --hard @{upstream}
```
