#!/bin/sh
# btt="#(~/.dotfiles/.tmux/.show_btty_graph.sh `~/dotfiles/bin/sh/mybattery -ep`)"
btt="#(~/dotfiles/bin/sh/mybattery -ep)"
btt_graph="#(~/dotfiles/.tmux/.show_btty_graph.sh)"
wifi="#(wifi)"
date="#(~/dotfiles/.tmux/.date_format4eng.sh)"
# prompt="${btt} ️${btt_graph}| ${wifi} | ${date}"
prompt=" ⚡️${btt}%${btt_graph}| 🌐 ${wifi} | ${date}"

echo $prompt