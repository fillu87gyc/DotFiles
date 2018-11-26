function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c] peco_select_ghq_repository  # 追加
end

# set -x PATH (echo $PATH | tr ' ' '\n' | sort -u)
# viでもvimで開く
# alias vi='/usr/bin/vim'
alias vi='nvim'
alias vim='nvim'
## rmでゴミ箱に入れる
set -g theme_display_git_master_branch yes
set -g theme_git_worktree_support yes
set -g fish_prompt_pwd_dir_length 0 
set -g theme_newline_cursor yes
set -g theme_display_date yes
alias rrm='remove_file.sh'
alias man='jman'
alias g='git'
alias ..='cd ..'
alias a.out='./a.out'
alias so='source'
alias reload='so ~/.config/fish/config.fish; and echo reload!!'
alias clr='clear'
alias mkdir='mkdir -p'
alias ll='ls -altFG'
alias lld='ls -altFGR'
alias color_sample='curl -L https://gist.githubusercontent.com/ytaniike/1002305/raw/f820537c4ade9db01e539d9727aad323486fc581/256colors_w_numbers.pl |perl'
alias iftop='iftop -i en1'
alias emacs='vim'
alias cot='open $1 -a "/Applications/CotEditor.app"'
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/Users/fill/dotfiles/bin/sh" $fish_user_paths
set -g fish_user_paths "/Users/fill/dotfiles/bin/fish" $fish_user_paths
