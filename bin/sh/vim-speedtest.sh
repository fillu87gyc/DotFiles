#!/bin/bash

function vim-speed-test()
{
  # echo $#
  if [ $# -eq 0 ]; then
    file_name=$(date '+%m%d-%H-%M-%S')
    nvim --startuptime ~/dotfiles/vim/logs/$file_name.log
    nvim ~/dotfiles/vim/logs/$file_name.log
    exit 1
  fi
  # file_name=`echo $1 | awk '{print substr($0, index($0, "/"))}'`
  # file_name=`echo $file_name |cut -c 2-`
  temp=$1
  file_name=${temp##*/}
  file_name=$(date '+%m%d-%H-%M-%S')'___'$file_name'___'
  echo $file_name
  nvim $1 --startuptime ~/dotfiles/vim/logs/$file_name.log
  nvim ~/dotfiles/vim/logs/$file_name.log
  exit 0
}
vim-speed-test $1
