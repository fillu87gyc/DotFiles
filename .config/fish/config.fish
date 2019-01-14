
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/Users/fill/dotfiles/bin/sh" $fish_user_paths
set -g fish_user_paths "/Users/fill/dotfiles/bin/fish" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths
set -g fish_user_paths "/Users/fill/go/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/bin" $fish_user_paths
set -g fish_user_paths "/Users/fill/.rbenv/shims" $fish_user_paths
status --is-interactive; and source (rbenv init -|psub)

alias vi='nvim'
alias vim='/usr/local/bin/vim'

set -g theme_display_git_master_branch yes
set -g theme_git_worktree_support yes
set -g fish_prompt_pwd_dir_length 0
set -g theme_newline_cursor yes
set -g theme_display_date yes

function fish_right_prompt; end

set -g GHQ_ROOT '/Users/fill/src'

source /Users/fill/dotfiles/.config/fish/functions/key_bind/fzf-key-bindings-ghq.fish
source /Users/fill/dotfiles/.config/fish/functions/key_bind/fzf-key-bindings-default.fish
source /Users/fill/dotfiles/.config/fish/functions/key_bind/fzf-z.fish

alias t='tmuximum'
alias rrm='remove_file.sh'
alias man='jman'
alias g='git'
alias gbr='hub browse'
alias gis='hub issue'
alias gisc='hub issue create -oc'
alias ..='cd ..'
alias a.out='./a.out'
alias so='source'
alias reload='so ~/.config/fish/config.fish; and echo reload!!'
alias re='reload'
alias clr='clear'
alias mkdir='mkdir -p'
alias ll='ls -altFG'
alias lld='ls -altFGR'
alias color_sample='curl -L https://gist.githubusercontent.com/ytaniike/1002305/raw/f820537c4ade9db01e539d9727aad323486fc581/256colors_w_numbers.pl |perl'
alias iftop='iftop -i en1'
alias cot='open $1 -a "/Applications/CotEditor.app"'
alias sp='bash ~/dotfiles/bin/sh/vim-speedtest.sh'
alias gl='git log --color --graph --pretty=format:"%C(red reverse)%d%Creset%C(white reverse) %h% Creset %C(green reverse) %an<@%cn> %Creset %C(cyan)%ar%Creset%n%C(white bold)%w(80) %s%Creset%n%n%w(80,2,2)%b" | emojify | less -r'
alias sot='open $1 -a "/Applications/Sourcetree.app"'
alias dec2hex='printf '%x\n' '
function g --wraps git
  hub $argv;
end
