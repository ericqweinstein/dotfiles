alias ls "exa -lah"
alias l "ls"
alias c "clear"
alias u "cd .."
alias bx "bundle exec"
alias bxr "bundle exec rake"
alias tree "tree -C"

set -x PATH "$HOME/.rbenv/bin" $PATH
. (rbenv init - | psub)

set fish_greeting ""
