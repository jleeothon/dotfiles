source /usr/local/opt/asdf/asdf.fish

set PATH "$HOME/bin" $PATH

alias vim=nvim
alias packs="cd packages"

eval (direnv hook fish)
