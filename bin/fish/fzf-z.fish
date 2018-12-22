function fzf_z
  set z_data_path '/Users/fill/dotfiles/.config/fish'

  grep -v "\.\git" $z_data_path/z-data > $z_data_path/z.tmp
  cat $z_data_path/z.tmp > $z_data_path/z-data
  rm $z_data_path/z.tmp

  z -l | awk '{ print $2 }' |fzf --height 30% --reverse --border |  read recent
  if [ $recent ]
    cd $recent
    commandline -t ""
    commandline -f repaint
  end
end
