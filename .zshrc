export PATH=/usr/local/bin:$PATH
export LANG=ja_JP.UTF-8
export IBM_DB_HOME=$HOME/sqllib
export RSENSE_HOME=/home/develop/.vim/bundle/rsense
# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/develop/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias ls='ls --color'
alias ll='ls -l'
alias vi='vim'
setopt correct
setopt correct_all
setopt prompt_subst


#if [ -f /home/develop/sqllib/db2profile ]; then
#    . /home/develop/sqllib/db2profile
#fi
