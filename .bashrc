# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

# make doas work
complete -cf doas

# Stylize
PS1="\$ \W > "

# Aliases
alias "sudo"="doas"
alias "vim"="nvim"
alias "vi"="nvim"
alias "nvp"="nvimpager"
alias "ll"="ls -l"
alias "la"="ls -la"

# Binds
# Auto-Completion
# Cycle with TAB through suggests.
bind 'TAB:menu-complete'
# Shift-Tab to cycle backwards
bind '"\e[Z": menu-complete-backward'

# Display a list of matches
bind "set show-all-if-ambiguous on"

# 1st TAB: List
# 2nd TAB: Cycle
bind "set menu-complete-display-prefix on"

# Cycle back based on current typed command
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

bind '"\e[1;5C":forward-word'
bind '"\e[1;5D":backward-word'

# starship
eval "$(starship init bash)"

