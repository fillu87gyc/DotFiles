function fzf_key_bindings_ghq
  function __ghq_cd_repository -d "Change local repository directory"
    ghq list --full-path | fzf | read -l repo_path
    if [ $repo_path ]
      cd $repo_path
      commandline -r ''
      commandline -f repaint
    end
  end

  function __ghq_browse_github -d "Browse remote repository on github"
    ghq list | fzf | read -l repo_path
    set -l repo_name (string split -m1 "/" $repo_path)[2]
    if [$repo_name]
      hub browse $repo_name
    end
  end

  alias ghb __ghq_browse_github
  bind \cg __ghq_cd_repository
  bind \cb __ghq_browse_github

end
