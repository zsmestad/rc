# https://unix.stackexchange.com/questions/678513/oh-my-zsh-take-command-is-there-an-equivalent-in-fish
function take
    mkdir -p "$argv[1]"; and cd "$argv[1]"
end
