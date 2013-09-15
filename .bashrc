# Add NPM binaries
PATH=$PATH:/usr/local/Cellar/node/HEAD/bin

# Include current Git branch in prompt
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="\e[1;31m\u\e[1;30m[\w]\e[m\e[1;32m\$(__git_ps1) \e[1;37m\$ \e[m"

# Vim key bindings on the command line
set -o vi

# Source util functions
source ~/utils/up.sh

# Source app environment variables
source ~/utils/.env

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Specify Vim as the editor (for Bundler)
export EDITOR=vim

# Tune Ruby 1.9.3 GC for faster RSpec suites
export RUBY_HEAP_MIN_SLOTS=2000000
export RUBY_HEAP_FREE_MIN=20000
export RUBY_GC_MALLOC_LIMIT=100000000

# Aliases
alias ls="ls -p"
alias l="ls -p"
alias c="clear"
alias u="cd .. ;"
alias back="cd - ;"
alias cl="c; l;"

