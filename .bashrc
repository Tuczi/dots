#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR='/usr/bin/vim'


alias ls='ls --color=auto'
alias ll='ls -AlhG'
# Order: dir - symlink - socket - pipe - exec - block special - char special - exec setuid - exec setgid - public dir sticky bit - public dir no sticky bit
export LSCOLORS='exfxcxdxbxegedabagacad'

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

source /usr/share/git/completion/git-prompt.sh
PS1='\[\e[1;34m\][\[\e[1;32m\]\u\[\e[1;34m\]@\h \[\e[1;32m\]\W\[\e[0;33m\]$(__git_ps1 " (%s)")\[\e[1;34m\]]\\$\[\e[0m\] '

case "$TERM" in
       xterm*) export TERM=xterm-256color
esac
