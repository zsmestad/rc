# Put these paths on the front of $PATH if the directory exists
set path_pre \
    "$HOME/.rbenv/shims" \
    "$HOME/.pyenv/shims" \
    "$HOME/.nix-profile/bin" \
    '/nix/var/nix/profiles/default/bin' \
    "$HOME/.rvm/bin" \
    "$HOME/.cargo/bin" \
    "$HOME/bin" \
    "$HOME/.local/bin" \
    '/usr/local/bin' \
    '/usr/local/sbin' \
    "$HOME/.krew/bin" \
    "$HOME/.fzf/bin"

for p in $path_pre[-1..1]
    # Erase if existing in PATH
    if set -l i (contains -i "$p" $PATH)
        set -e PATH[$i]
    end
    # Prepend if dir exists
    if [ -d "$p" ]
        set -p PATH "$p"
    end
end

if status is-interactive
    set -g fish_key_bindings fish_vi_key_bindings

    exists_in_path starship; and starship init fish | source
    exists_in_path zoxide; and zoxide init fish | source
    exists_in_path direnv; and direnv hook fish | source

    exists_in_path sccache; and set -x RUSTC_WRAPPER sccache
    [ -f ~/.config/ripgrep/conf ]; and set -x RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/conf"

    abbr --add l  ls -lF
    abbr --add lh ls -lFh

    # Kubernetes
    abbr --add kc kubectl
    abbr --add kx kubectx
    abbr --add kn kubens
end

