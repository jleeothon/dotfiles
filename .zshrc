export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# All times in milliseconds
# Change zshrc_timeit_debug to print durations or not
function zshrc_timeit_debug { return 0 }
function zshrc_now { printf '%0.f' "$(echo "$(gdate '+%s.%N') * 1000" | bc)" }
function _zshrc_timeit {
	local line_no=$1
	local last_time=$2
	local new_now=$(zshrc_now)
	local diff=$(expr "$new_now" - "$last_time")
	printf "∆t(%i) = %4.i ms\n" "$line_no" "$diff" >&2
	# echo "$line_no: $diff ms" >&2
	echo "$new_now"
}
alias zshrc_timeit='zshrc_timeit_debug && ZSHRC_LAST_TIME=$(_zshrc_timeit $LINENO $ZSHRC_LAST_TIME)'

ZSHRC_INIT_TIME=$(zshrc_now)
ZSHRC_LAST_TIME="$ZSHRC_INIT_TIME"

zshrc_timeit
# source "$HOME/.zplug/init.zsh"
zshrc_timeit

zshrc_timeit
[ -f "$HOME/.private.zshrc" ] && source "$HOME/.private.zshrc"
zshrc_timeit

bindkey -v
bindkey '^R' history-incremental-pattern-search-backward

zshrc_timeit

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
# prompt pure
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
# zshrc_timeit
# export NVM_LAZY_LOAD=true
# zplug "lukechilds/zsh-nvm"
# zshrc_timeit

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
# zplug load
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

alias g=git

ZSHRC_FINISH_TIME=$(zshrc_now)
(( ZSHRC_TOTAL_TIME = $ZSHRC_FINISH_TIME - $ZSHRC_INIT_TIME ))
printf '   ∑∆t = %4i ms' "$ZSHRC_TOTAL_TIME"

unfunction zshrc_timeit_debug
unfunction zshrc_now
unfunction _zshrc_timeit
unalias zshrc_timeit

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
