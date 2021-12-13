function vim
if exists_in_path nvim
nvim $argv
else
vim $argv
end
end
