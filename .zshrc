# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

ZSHRC_INIT_TIME=$(gdate '+%s.%N')
# Change zshrc_timeit_debug to print durations or not
function zshrc_timeit_debug { return 0 }
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
source "$HOME/.zplug/init.zsh"
zshrc_timeit

zshrc_timeit
[ -f "$HOME/.private.zshrc" ] && source "$HOME/.private.zshrc"
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

zshrc_timeit
PURE_GIT_PULL=0
autoload -U promptinit; promptinit
prompt pure
zshrc_timeit

zshrc_timeit
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/bin:$PATH"
zshrc_timeit

zshrc_timeit
alias init-rbenv='eval "$(rbenv init -)"'
zshrc_timeit

zshrc_timeit
alias init-pyenv='eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)'
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
zshrc_timeit

# zplug
zshrc_timeit
export NVM_LAZY_LOAD=true
zplug "lukechilds/zsh-nvm"
zshrc_timeit

zshrc_timeit
# Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose
# then
# 	printf "Install? [y/N]: "
# 	if read -q
# 	then
# 		echo; zplug install
# 	fi
# fi
# Then, source plugins and add commands to $PATH
zplug load
zshrc_timeit

export PATH="$HOME/packer:$PATH"

alias cl=clear

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Heaven knows why mein Komputer otherwise in German otherwise
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias vim=nvim

# Needs to run first:
# docker build -t docker-show-context https://github.com/pwaller/docker-show-context.git
alias docker-show-context='docker run -v $PWD:/data docker-show-context'

ZSHRC_FINISH_TIME=$(gdate '+%s.%N')
(( ZSHRC_TOTAL_TIME = $ZSHRC_FINISH_TIME - $ZSHRC_INIT_TIME ))
echo "Total: $ZSHRC_TOTAL_TIME"
