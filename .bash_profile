export PATH="$HOME/.bin:$PATH"

source "$HOME/.private.bash_profile"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# GIT_PS1_SHOWDIRTYSTATE=true
# export PS1='[\u@mbp \w$(__git_ps1)]\$ '
