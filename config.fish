alias ls "exa -la"
alias l "ls"
alias c "clear"
alias u "cd .."
alias bx "bundle exec"
alias bxr "bundle exec rake"

set -x PATH "$HOME/.rbenv/bin" $PATH
. (rbenv init - | psub)
