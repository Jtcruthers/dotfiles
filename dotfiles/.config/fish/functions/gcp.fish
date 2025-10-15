function gcp --wraps='git checkout release/production' --description 'alias gcp git checkout release/production'
  git checkout release/production $argv
        
end
