set PATH "$HOME/bin" $PATH

if status is-interactive
    # Commands to run in interactive sessions can go here
end

source /opt/homebrew/opt/asdf/libexec/asdf.fish
direnv hook fish | source

source /opt/homebrew/opt/asdf/libexec/asdf.fish

# Find files with Ctrl+F
# Find modified paths with Ctrl+G+S (git status)
# Find commit hashes with Ctrl+G+L (git log)
fzf_configure_bindings --directory=\cf --git_log=\cgl --git_status=\cgs
