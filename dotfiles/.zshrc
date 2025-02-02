# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PYTHONPATH="~/Library/Python/3.9/lib/python/site-packages:$PYTHONPATH"

. "$HOME/.asdf/asdf.sh"

export PATH=~/.npm-global/bin:$PATH
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

# Add personal bin folder to path
export PATH=$HOME/bin:$PATH

export EDITOR=nvim

# Git
alias gcm="git checkout master"
alias gcd="git checkout release/dev"
alias gcs="git checkout release/staging"
alias gcp="git checkout release/production"
alias gmm="git merge master"
alias grm="git rebase -i master"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias grs="git rebase --skip"
alias gcne="git commit --amend --no-edit"

# AWS SAM
alias sb="sam build --use-container"
alias si="sam local invoke"
alias sds="sam deploy --config-env staging"
alias sdp="sam deploy --config-env production"

# AWS
alias awsp="aws --profile vv-prod"
alias awsd="aws --profile vv-dev"

# 8base
alias 8bm="8base migration"
alias 8bd="8base deploy"

# Tmux
alias tmux="TERM=xterm-256color tmux"
alias ta="tmux a -t"
alias tl="tmux ls"

# Interpreters
alias p="python3"
alias n="node"
alias vim="/usr/local/bin/nvim" # Use nvim instead
alias pgstart="docker run --name postgres -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=postgres -d postgres"

# Shortcuts
alias c="clear"

# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# bun completions
[ -s "/Users/justin/.bun/_bun" ] && source "/Users/justin/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/justin/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# opam configuration
[[ ! -r /Users/justin/.opam/opam-init/init.zsh ]] || source /Users/justin/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
export PATH="$PATH:/usr/local/opt/postgresql@16/bin"
