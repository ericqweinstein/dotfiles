alias l "ls -p"
alias ls "ls -p"
alias c "clear"
alias u "cd .."
alias bx "bundle exec"
alias bxr "bundle exec rake"

set -x PATH "$HOME/.rbenv/bin" $PATH
. (rbenv init - | psub)
