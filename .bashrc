#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cls='clear'
alias ff='fastfetch'

# Can also use ip link
alias nmd='nmcli device'
alias nmdw='nmcli device wifi'
alias nmdwr='nmcli device wifi rescan'

alias avim="NVIM_APPNAME=nvim_acob nvim"
alias lvim="NVIM_APPNAME=nvim_lazy nvim"
# alias kvim="NVIM_APPNAME=kick-nvim nvim"

PS1='[\u@\h \W]\$ '

export EDITOR=nvim
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}
