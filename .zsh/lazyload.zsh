# kubectl
function kubectl () {
  local kubectl="$(whence -p kubectl 2> /dev/null)"
  [ -z "$_lazy_kubectl_completion" ] && {
    echo "\e[31m$0 completion zsh\e[0m" > /dev/stderr
    source <("$kubectl" completion zsh)
    _lazy_kubectl_completion=1
  }
  "$kubectl" "$@"
}

# helm
function helm () {
  local helm="$(whence -p helm 2> /dev/null)"
  [ -z "$_lazy_helm_completion" ] && {
    echo "\e[31m$0 completion zsh\e[0m" > /dev/stderr
    source <("$helm" completion zsh)
    _lazy_helm_completion=1
  }
  "$helm" "$@"
}

# eksctl
function eksctl () {
  local helm="$(whence -p eksctl 2> /dev/null)"
  [ -z "$_lazy_eksctl_completion" ] && {
    echo "\e[31m$0 completion zsh\e[0m" > /dev/stderr
    source <("$eksctl" completion zsh)
    _lazy_eksctl_completion=1
  }
  "$eksctl" "$@"
}

