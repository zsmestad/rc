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
    set -l i (contains -i "$p" $PATH); and set -e PATH[$i]
    # Prepend if dir exists
    test -d "$p"; and set -p PATH "$p"
end

if status is-interactive
    # TODO: figure out where this is coming from
    abbr --erase vim

    set -x EDITOR (command -s nvim vim vi | head -n 1)
    set -x PAGER (command -s less)
    set -x VISUAL "$EDITOR"
    set -x LESSEDIT "$EDITOR"
    set -x LESSCHARSET 'utf-8'
    set -x LESS '--ignore-case -RFX'

    # Init
    command -q starship; and starship init fish | source
    command -q zoxide; and zoxide init fish | source
    command -q direnv; and direnv hook fish | source

    # Completions
    command -q lab; and lab completion | source
    command -q just; and just --completions fish | source
    command -q limactl; and limactl completion fish | source

    # Shell vars
    command -q sccache; and set -x RUSTC_WRAPPER sccache
    test -f ~/.config/ripgrep/conf; and set -x RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/conf"
    test (uname) = 'Darwin'; and set -x APPLE_SSH_ADD_BEHAVIOR 'macos'

    # Abbrs
    abbr --add l  ls -lF
    abbr --add lh ls -lFh
    abbr --add ..   cd ..
    abbr --add ...  cd ../..
    abbr --add .... cd ../../..
    abbr --add cl clear

    abbr --add gpu git push --set-upstream origin '(git branch --show-current)'

    abbr --add kc kubectl
    abbr --add kx kubectx
    abbr --add kn kubens
    abbr --add kb kubie

    # Local config (in `.gitignore`)
    test -f ~/.config/fish/local_config.fish; and source ~/.config/fish/local_config.fish
    test -d ~/.config/fish/local_functions; and set -a fish_function_path ~/.config/fish/local_functions
end

