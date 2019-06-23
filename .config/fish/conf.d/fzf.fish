set -U FZF_LEGACY_KEYBINDINGS 0

set -x FZF_DEFAULT_COMMAND      'rg --files --hidden --follow --glob "!.git/*" 2> /dev/null'
set -x FZF_DEFAULT_OPTS         '--height 60% --reverse --border'

set -x FZF_FIND_FILE_COMMAND    'find . -type d -name '.git' -prune -o -type f -print  2> /dev/null'
set -x FZF_FIND_FILE_OPTS       '--preview "coderay {} | head -n 30"'

set -x FZF_CD_COMMAND           'find . -type d -name '.git' -prune -o -type d -print 2> /dev/null'
set -x FZF_CD_OPTS              '--preview "tree -C {} | head -200"'

set -x FZF_TMUX                 1

function fzf_uninstall -e fzf_uninstall
    # disabled until we figure out a sensible way to ensure user overrides
    # are not erased
    # set -l _vars (set | command grep -E "^FZF.*\$" | command awk '{print $1;}')
    # for var in $_vars
    #     eval (set -e $var)
    # end
end
