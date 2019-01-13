#!/bin/sh
# btt="#(~/.dotfiles/.tmux/.show_btty_graph.sh `~/dotfiles/bin/sh/mybattery -ep`)"
btt="#(~/dotfiles/bin/sh/mybattery -ep)"
btt_graph="#(~/dotfiles/.tmux/.show_btty_graph.sh)"
wifi="#(wifi)"
date="#(~/dotfiles/.tmux/.date_format4eng.sh)"
prompt="#[bg=colour234]#(~/dotfiles/.tmux/get_net_speed.sh)#[bg=colour237] ${btt}%${btt_graph}#[bg=colour239] #[bg=colour242] ${wifi} #[bg=colour244] ${date}"
echo $prompt
