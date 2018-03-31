# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Change zshrc_timeit_debug to print durations or not
function zshrc_timeit_debug { return 1 }
function zshrc_now { gdate '+%s.%N' }
ZSHRC_LAST_TIME=$(zshrc_now)
function _zshrc_timeit {
	LINE_NUMBER=$1
	LAST_TIME=$2
	NEW_NOW=$(zshrc_now)
	(( DIFF = $NEW_NOW - $LAST_TIME ))
	echo "$LINE_NUMBER: $DIFF" >&2
	echo $NEW_NOW
}
alias zshrc_timeit='zshrc_timeit_debug && ZSHRC_LAST_TIME=$(_zshrc_timeit $LINENO $ZSHRC_LAST_TIME)'

zshrc_timeit

bindkey -v
bindkey '^R' history-incremental-pattern-search-backward

zshrc_timeit

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/othon/.zshrc'

zshrc_timeit

fpath=(~/.zsh/completion $fpath)

zshrc_timeit

autoload -Uz compinit
zshrc_timeit
compinit -u
zshrc_timeit

PURE_GIT_PULL=0
zshrc_timeit
autoload -U promptinit; promptinit
zshrc_timeit
prompt pure
zshrc_timeit

# This one is slow!
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

zshrc_timeit
export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"
zshrc_timeit
export PATH="/usr/local/sbin:$PATH"
zshrc_timeit
export PATH="$HOME/bin:$PATH"
zshrc_timeit

[ -f "$HOME/.private.zshrc" ] && source "$HOME/.private.zshrc"
zshrc_timeit

# added by travis gem
[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"

zshrc_timeit

function nvm { echo 'Please run nvm-init' >&2 }
alias nvm-init='
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
'

eval "$(rbenv init -)"
zshrc_timeit

eval "$(pyenv init -)"
zshrc_timeit
eval "$(pyenv virtualenv-init -)"
zshrc_timeit

zshrc_timeit
