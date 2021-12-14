function tt --description 'Attach to free tmux session or start a new one'
  tmux list-sessions | grep -v '\(attached\)' > /dev/null
  and tmux -u attach
  or tmux -u
end
