function fish_user_key_bindings
  exists_in_path fzf; and fzf_key_bindings
  fish_vi_key_bindings --no-erase
end
