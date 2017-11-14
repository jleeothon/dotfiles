# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Use this command to time parts of the script
# te=$(gdate +%s.%N); ! [ -z $ts ] && (( td = $te - $ts )) && echo "${c:0}: $td"; ts=$(gdate +%s.%N); (( c = c + 1 ))

bindkey -v
bindkey '^R' history-incremental-pattern-search-backward

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/othon/.zshrc'

fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit
compinit -u

PURE_GIT_PULL=0
autoload -U promptinit; promptinit
prompt pure

# This one is slow!
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/bin:$PATH"

[ -f "$HOME/.private.zshrc" ] && source "$HOME/.private.zshrc"

# aliases

alias rakeg="rake -g"

# added by travis gem
[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"

# This one is very slow!
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(rbenv init -)"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
