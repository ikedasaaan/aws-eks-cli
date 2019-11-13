
# Source Zshrc.
if [[ -d "${ZDOTDIR:-$HOME/.zsh}" ]]; then
  source "${ZDOTDIR:-$HOME/.zsh/alias.zsh}"
  source "${ZDOTDIR:-$HOME/.zsh/completion.zsh}"
  # ssource "${ZDOTDIR:-$HOME/.zsh/lazyload.zsh}"
fi

export EDITOR=vim

source /usr/bin/aws_zsh_completer.sh
source /usr/local/bin/kube-ps1.sh

precmd() {
  local left="$(kube_ps1)"
  print -P $left
}

PROMPT='%F{cyan}%n@%m%f:%~$ '
# 現在時刻
RPROMPT=$'%{\e[38;5;251m%}%D{%b %d}, %*%{\e[m%}'
TMOUT=1
TRAPALRM() {
  zle reset-prompt
}

