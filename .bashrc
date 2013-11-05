#if not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history.
# … or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# Save multi-lines commandsin the history
shopt -s cmdhist
# append to the history file ,don't overwrite it
shopt -s histappend
#Enable re-edition of failed commands
shopt -s histreedit
#git-like '**' path expansion
shopt -s globstar
#don't try to complete empty lines
shopt -s no_empty_cmd_completion
#update the value of LINES and COLUMS after each command
shopt -s checkwinsize
#if a command name is name of directory, dc into it
shopt -s autocd

#history length
HISTSIZE=1000
HISTFILESIZE=2000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls/grep/…
DIRCOLOR=
[ -x /usr/bin/dircolors ] || [[ $(tput -T$TERM colors) -ge 8 ]] && DIRCOLOR='--color=auto'

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#-------------------------------------------
#       Perso
#-------------------------------------------
PS1_PREFIX=' '
PS1_SYMBOL='⚡'

function _bash_prompt_command {

	local GITPROMPT=
		local GITUNSTAGED=' '
		local GITBR=

		[ $EUID -eq 0 ] && PS1_SYMBOL='#'

		local GITSTATUS=$(git status 2> /dev/null)

		if [ $? -eq 0 ]; then
			echo $GITSTATUS | grep 'not staged' &> /dev/null
				if [ $? -eq 0 ]; then
					if [ $DIRCOLOR ]; then
						GITUNSTAGED="\[\033[1;31m\]+\[\033[0m\]"
					else
						GITUNSTAGED='+'
					fi
				fi

				GITBR=$(git describe --contains --all HEAD 2> /dev/null)

				if [ $? -eq 0 ]; then
					if [ $DIRCOLOR ]; then
						GITPROMPT="\033[0;36m{$GITBR}\[\033[0m\]$GITUNSTAGED";
					else
						GITPROMPT="{$GITBR}$GITUNSTAGED";
					fi
				fi
		fi

		PS1="${PS1_PREFIX}\W ${GITPROMPT}";
		if [ $DIRCOLOR ]; then
			# colors
			PS1="${PS1}\[\033[1;33m\]${PS1_SYMBOL}\[\033[0m\] "
		else
			# no colors
			PS1="${PS1}${PS1_SYMBOL} "
		fi
}
# If connected through SSH, print the hostname
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || [ -n "$SSH_CONNECTION" ]; then
	PS1_PREFIX='\h:'
fi

case $TERM in
    xterm*|rxvt*|aterm|kterm|gnome*)
        _bash_prompt_command;
        PROMPT_COMMAND='_bash_prompt_command';;
    *)
        ;;
esac

#need <C-d> twice to quit
ignoreeof=1

# variables
export EDITOR='vim'
export PS2='...'

#Programming 
alias vim='vim -p'

# OCaml
alias locaml='ledit ocaml'

#python
alias python='python3.2'


#usual
alias ps='ps x'
alias shred='shred -n 50 -z -u'
alias wipe='wipe -r -i -Q 50'
alias top='htop'

alias ls='ls -Fhl --color --group-directories-first'
alias l=ls
alias la='ls -a'
alias lszip='unzip -l'

alias -- -='cd -'
alias +x='chmod u+x'

alias du='du -h'
alias df='df -h'

alias grep="grep $DIRCOLOR"
alias fgrep="fgrep $DIRCOLOR"
alias egrep="egrep $DIRCOLOR"

alias sai='sudo apt-get install'
alias saupg='sudo apt-get upgrade'
alias saupd='sudo apt-get update'


# bashrc
alias openbashrc='vim ~/.bashrc'
alias reload='source ~/.bashrc'

alias sl='sl -e'
alias LS='LS -e'

alias ev='evince'

# one-letter shortcuts
alias c='cd -P'
alias f=find
alias g=git
alias m=mv
alias s=sudo
alias v=vim

# two-letters ones
alias ct=cat
alias ff='find . -name "*~" -delete'
alias sv='sudo vim -p'

# git
# see github.com/icefox/git-achievements
#alias git='git -achievements'
# alias g=git
#alias g='git -achievements'

#perso
alias Ofac="sshfs galichet@lucien.informatique.univ-paris-diderot.fr:/info/master1/galichet ~/Fac	"
alias Ffac="fusermount -u ~/Fac"
alias sauvC="sh .bashsauvC.sh"

alias connectN="ssh galichet@nivose.informatique.univ-paris-diderot.fr"
alias connectL="ssh galichet@lucien.informatique.univ-paris-diderot.fr"

# Flash cookies
rm -Rf ~/.adobe/*
rm -Rf ~/.macromedia/*

# Path command administration 
PATH="${PATH}:/usr/sbin:/sbin/:"

# by AC6
#export http_proxy=http://cache:3128

# starting
cp ~/.bashrc ~/.bashrc_autosave

