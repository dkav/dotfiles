#============================================================
#
#  BASE ZSH SETTINGS
#
#============================================================
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/Darren/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall


#============================================================
#
# PERSONAL SETTINGS
#
#============================================================
# TERMINAL & SHELL
# ----------------
# Window Title
# Change Terminal title in same manner as bash
if [[ "$TERM_PROGRAM" == "Apple_Terminal" && -z "$INSIDE_EMACS" ]]; then
    update_terminal_hook() {
	local SEARCH=' '
	local REPLACE='%20'
	local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
	printf '\e]7;%s\a' "$PWD_URL"
    }
    typeset -a precmd_functions
    if [[ -z $precmd_functions[(r)update_terminal_hook] ]]; then
        precmd_functions+=update_terminal_hook
    fi
fi

# Shell Prompt
# Change prompt when in vi command mode
function zle-line-init zle-keymap-select {
    PS1="${${KEYMAP/vicmd/%% }/(main|viins)/$ }"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# Tab Completion
# Ignore case
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# ALIASES
# -------
# 'ls'  Aliases
alias ls="ls -G"
alias ll="ls -lh"
alias la="ls -lah"
alias lt="ls -laht"
alias lh="ls -lad .*"

# Windows Aliases
alias cls="clear"
alias dir="ls"

# Development Aliases
alias ddd="cd /Users/Darren/Documents/Development"
alias pws="python -m SimpleHTTPServer &"
alias ipn="ipython notebook"

