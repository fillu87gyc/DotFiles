set -U FZF_LEGACY_KEYBINDINGS 0
set -x FZF_DEFAULT_OPTS '--height 60% --reverse --border' 
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -x FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_CTRL_T_COMMAND 'find . -type f 2>/dev/null'
# set -x FZF_CTRL__COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_ALT_C_COMMAND 'find . -type d -name '.git' -prune -o -type d -print 2> /dev/null'