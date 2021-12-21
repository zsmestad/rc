function vim
  if command -qs nvim
    nvim $argv
  else
    command vim $argv
  end
end
