set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

set -l path_pre \
    "$HOME/.cargo/bin" \
    "$HOME/bin" \
    "$HOME/.local/bin" \
    /opt/homebrew/bin \
    /usr/local/bin \
    /usr/local/sbin \
    /Applications/MakeMKV.app/Contents/MacOS

for p in $path_pre[-1..1]
    fish_add_path -m "$p"
end

if status is-interactive
    set -g fish_key_bindings fish_vi_key_bindings
    set -g fish_features qmark-noglob

    set -x EDITOR (command -s hx nvim vim vi | head -n 1)
    set -x PAGER (command -s less)
    set -x VISUAL "$EDITOR"
    set -x LESSEDIT "$EDITOR"
    set -x LESSCHARSET utf-8
    set -x LESS '--ignore-case -RFX'

    # Init
    command -q direnv; and direnv hook fish | source
    command -q mise; and mise activate fish | source
    command -q starship; and starship init fish | source
    command -q zoxide; and zoxide init fish | source

    # Completions - dump into completions dir if not existing
    set -l completions \
        'just --completions fish' \
        'limactl completion fish' \
        'mise completion fish' \
        'rg --generate complete-fish'

    for cmp_cmd in $completions
        set -l cmd (string split ' ' $cmp_cmd)[1]
        set -l cmp_file "$__fish_config_dir/completions/$cmd.fish"
        if not test -f "$cmp_file"; and command -q $cmd
            echo "Generate completions for $cmd"
            eval $cmp_cmd >"$cmp_file"
        end
    end

    # Shell vars
    command -q sccache; and set -x RUSTC_WRAPPER sccache
    test -f ~/.config/ripgrep/conf; and set -x RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/conf"

    switch (uname)
        case Darwin
            set -x APPLE_SSH_ADD_BEHAVIOR macos
            abbr --add disks 'df -h'
        case Linux
            abbr --add disks "df -Th | grep -vE '^(/dev/loop|tmpfs|udev)'"
    end

    # ls fun
    if command -q lsd
        alias ls lsd
        abbr --add l@ 'command ls --color=auto -lF@'
    else
        alias ls 'ls --color=auto'
        abbr --add l@ 'ls -lF@'
    end
    abbr --add l ls -lF
    abbr --add lh ls -lFh

    # Abbrs
    abbr --add .. cd ..
    abbr --add ... cd ../..
    abbr --add .... cd ../../..
    abbr --add cl clear

    abbr --add ta 'tmux -u attach'

    # Use with env var name at end
    abbr --add secret 'read -sxP "Secret: "'

    # Git Abbrs
    abbr --add g git
    abbr --add gds git diff --staged
    abbr --add gpp git pull --prune
    abbr --add gpu git push --set-upstream origin '(git branch --show-current)'

    # cargo install sd gitoxide
    abbr --add repos 'ein tool find | sd "^\./" ""'

    # K8s Abbrs
    abbr --add kb kubie
    abbr --add kc kubectl
    abbr --add kn kubens
    abbr --add kx kubectx

    # Update Abbrs
    if command -q brew
        abbr --add upd 'brew update && brew outdated'
        abbr --add upg 'brew upgrade'
    else if command -q apt
        abbr --add upd 'sudo apt update && apt list --upgradable'
        abbr --add upg 'sudo apt upgrade -y'
    end

    # Open Abbrs
    if command -q open
        abbr --add o open
        abbr --add o. 'open .'
    else if command -q xdg-open
        abbr --add o xdg-open
        abbr --add o. 'xdg-open .'
    end

    # Pueue
    if command -q pueue
        abbr --add p pueue
        abbr --add pd 'pueued -d'
        abbr --add pw 'watch -c pueue --color always'
    end

    # Local config (in `.gitignore`)
    test -f ~/.config/fish/local/config.fish; and source ~/.config/fish/local/config.fish
    test -d ~/.config/fish/local/functions; and set -a fish_function_path ~/.config/fish/local/functions
end
