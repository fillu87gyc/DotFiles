#!/bin/bash

function vim-speed-test()
{
  file_name=$(date '+%m%d-%H-%M-%S')
  vi --startuptime ~/dotfiles/vim/logs/$file_name.log 
  vi ~/dotfiles/vim/logs/$file_name.log
}
vim-speed-test
