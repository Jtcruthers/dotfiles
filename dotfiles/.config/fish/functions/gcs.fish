function gcs --wraps='git checkout release/staging' --description 'alias gcs git checkout release/staging'
  git checkout release/staging $argv
        
end
