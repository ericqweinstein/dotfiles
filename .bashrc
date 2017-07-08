# Include current Git branch in prompt
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Git autocomplete magicks
source ~/.git-completion.bash

# Include brew formulae on the PATH
export PATH="/usr/local/sbin:$PATH"

source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="\e[1;31m\u\e[1;30m[\w]\e[m\e[1;32m\$(__git_ps1) \e[1;37mλ \e[m"

# Vim key bindings on the command line
set -o vi

# Util dir nav function
source ~/utils/up.sh

# Environment variables
source ~/utils/.env

# rbenv
eval "$(rbenv init -)"

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"
export ANDROID_HOME=/usr/local/opt/android-sdk

# Clojure(Script)s
export LEIN_FAST_TRAMPOLINE=y
alias cljsbuild="lein trampoline cljsbuild $@"

# Go
export GOPATH="$HOME/projects/gos/bin"
export PATH=$GOPATH:$PATH

# NPM binaries
export PATH="/usr/local/lib/node_modules:$PATH"

# MTR, for whatever reason
export PATH="/usr/local/Cellar/mtr/0.85/sbin:$PATH"

# Vagrant
export PATH="/usr/local/bin:$PATH"

# Specify Vim as the editor (for Bundler)
export EDITOR=vim

# Aliases
alias l='ls -p'
alias ls='ls -p'
alias c='clear'
alias u='cd .. ;'
alias back='cd - ;'
alias cl='c; l;'
alias lc='colorls -r'
alias bx='bundle exec'
alias bxr='bundle exec rake'
alias gg='gem query --remote --name-matches'
alias rr='bxr db:drop && bxr db:create && bxr db:migrate && bxr db:seed'
alias start_pg="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias stop_pg="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# ML stuffs
export SMLROOT=/usr/local/sml
export PATH="$PATH:/usr/local/sml/bin"

# Idris stuffs
export PATH="$PATH:$HOME/.cabal/bin"
export PKG_CONFIG_PATH=/usr/local/Cellar/libffi/3.0.13/lib/pkgconfig

# NVM stuffs
export NVM_DIR="/Users/ericweinstein/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
