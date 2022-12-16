if test (arch) = i386
  set PATH /usr/local/bin $home/bin $PATH
end

if test (arch) = arm64
  set PATH $HOME/bin $PATH
end


if status is-interactive
    # Commands to run in interactive sessions can go here
end

direnv hook fish | source

source /opt/homebrew/opt/asdf/libexec/asdf.fish

# Find files with Ctrl+F
# Find modified paths with Ctrl+G+S (git status)
# Find commit hashes with Ctrl+G+L (git log)
fzf_configure_bindings --directory=\cf --git_log=\cgl --git_status=\cgs

set --export N_PREFIX $HOME/.n
set PATH $N_PREFIX/bin $PATH

export NPM_TOKEN=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

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
