function vim
  # Ubuntu magic doesn't like this:
  # command nvim $argv; or command vim $argv
  if command -q nvim
    command nvim $argv
  else
    command vim $argv
  end
end
