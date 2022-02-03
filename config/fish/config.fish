# Put these paths on the front of $PATH if the directory exists
set -l path_pre \
    "$HOME/.rbenv/shims" \
    "$HOME/.pyenv/shims" \
    "$HOME/.nix-profile/bin" \
    '/nix/var/nix/profiles/default/bin' \
    "$HOME/.cargo/bin" \
    "$HOME/bin" \
    "$HOME/.local/bin" \
    '/usr/local/bin' \
    '/usr/local/sbin' \
    '/usr/local/opt/mysql-client/bin' \
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
    # TODO: figure out where this is coming from
    abbr --erase vim

    if command -qs nvim
        set -x EDITOR (which nvim)
    else
        set -x EDITOR (which vim)
    end

    set -x PAGER (which less) -Rs
    set -x VISUAL "$EDITOR"
    set -x LESSEDIT "$EDITOR"
    set -x LESSCHARSET 'utf-8'
    set -x LESS '--ignore-case -R'

    command -qs starship; and starship init fish | source
    command -qs zoxide; and zoxide init fish | source
    command -qs direnv; and direnv hook fish | source

    command -qs sccache; and set -x RUSTC_WRAPPER sccache
    test -f ~/.config/ripgrep/conf; and set -x RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/conf"

    abbr --add l  ls -lF
    abbr --add lh ls -lFh
    abbr --add ..   cd ..
    abbr --add ...  cd ../..
    abbr --add .... cd ../../..

    # Kubernetes
    abbr --add kc kubectl
    abbr --add kx kubectx
    abbr --add kn kubens
    abbr --add kb kubie

    test (uname) = 'Darwin'; and set -x APPLE_SSH_ADD_BEHAVIOR 'macos'

    # Local config (in `.gitignore`)
    test -f ~/.config/fish/local_config.fish; and source ~/.config/fish/local_config.fish
    test -d ~/.config/fish/local_functions; and set -a fish_function_path ~/.config/fish/local_functions
end

