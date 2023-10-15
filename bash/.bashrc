# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

alias rm='rm -iv'

alias l='ls -l'
alias ll='ls -al'
alias la='ls -a'

alias v='nvim'
alias vim='nvim'
alias b='bat'

alias ..='cd ..'
alias ...='cd ../..'

alias get_idf='. $HOME/Github/installs/esp-idf/export.sh'

export GPG_TTY=$(tty)

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

unset rc

. "$HOME/.cargo/env"
