#if not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history.
# … or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file ,don't overwrite it
shopt -s histappend

#history length
HISTSIZE=1000
HISTFILESIZE=2000

# update the values of LINES and COLUMNS after each command
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls/grep/…
if [ -x /usr/bin/dircolors ]; then
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#-------------------------------------------
#       Perso
#-------------------------------------------

# variables
export EDITOR='vim'
export PS2='...'
export DEBFULLNAME='Galichet David'
export DEBEMAIL='galichet.david@yahoo.fr'

#usual
alias rm='rm -i'
alias rmdir='rm -Ri'

function mkcd() { mkdir $1 && cd $1; }
function cdl() { cd $1 && ls -Fgh; }

#perso
alias Ofac="sshfs galichet@lucien.informatique.univ-paris-diderot.fr:/info/nouveaux/galichet ~/Fac	"
alias Ffac="fusermount -u ~/Fac"
alias sauvC="sh .bashsauvC.sh"
alias connectN="ssh galichet@nivose.informatique.univ-paris-diderot.fr"
alias connectL="ssh galichet@lucien.informatique.univ-paris-diderot.fr"

