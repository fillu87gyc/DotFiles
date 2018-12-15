function fish_user_key_bindings
  fzf_key_bindings_default
  fzf_key_bindings_ghq
  bind \cy fzf_z
  bind \c] peco_select_ghq_repository  # 追加
  bind \co peco_z # Ctrl-[にバインドする
end
