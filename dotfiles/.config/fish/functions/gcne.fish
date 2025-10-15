function gcne --wraps='git commit --amend --no-edit' --description 'alias gcne git commit --amend --no-edit'
  git commit --amend --no-edit $argv
        
end
