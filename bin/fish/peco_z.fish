function peco_z

  grep -v "\.\git" $z_data_path/z-data > $z_data_path/z.tmp
  cat $z_data_path/z.tmp > $z_data_path/z-data
  rm $z_data_path/z.tmp

  set -l query (commandline)

  if test -n $query
    set peco_flags --query "$query"
  end

  z -l | peco $peco_flags | awk '{ print $2 }' | read recent
  if [ $recent ]
      cd $recent
      commandline -r ''
      commandline -f repaint
  end
end

