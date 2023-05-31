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
# doas
complete -cf doas
# Ranger
RANGER_LOAD_DEFAULT_RC="False"
# Wayland
export MOZ_ENABLE_WAYLAND="1"
export XDG_CURRENT_DESKTOP=sway
export QT_QPA_PLATFORM="wayland-egl"
# PATH
PATH="${PATH}:/home/user/.local/bin:"
# Aliases
alias "sudo"="doas"
alias "vim"="nvim"
alias "vi"="nvim"
alias "nvp"="nvimpager"
alias "ll"="ls -l"
alias "la"="ls -la"
#Binds
#Auto-Completion
#Cycle with TAB through suggests.
bind 'TAB:menu-complete'
#⋅Shift-Tab⋅to⋅cycle⋅backwards
bind '"\e[Z":menu-complete-backward'
#⋅Display⋅a⋅list⋅of⋅matches
bind "set show-all-if-ambiguous on"
#⋅2st⋅TAB:⋅List
#⋅2nd⋅TAB:⋅Cycle
bind "set menu-complete-display-prefix on"
#⋅Cycle⋅back⋅based⋅on⋅current⋅typed⋅command
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
bind '"\e[1;5C":forward-word'
bind '"\e[1;5D":backward-word'
#⋅starship
eval "$(starship init bash)"
# starting sway
if test -z "${XDG_RUNTIME_DIR}"; then
        export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
        if ! test -d "${XDG_RUNTIME_DIR}"; then
                mkdir "${XDG_RUNTIME_DIR}"
                chmod 0700 "${XDG_RUNTIME_DIR}"
        fi
fi
if [ "$(tty)" = "/dev/tty1" ]; then
	exec dbus-run-session sway
fi
