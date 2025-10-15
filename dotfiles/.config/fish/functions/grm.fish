function grm --wraps='git rebase -i master' --description 'alias grm git rebase -i master'
  git rebase -i master $argv
        
end
