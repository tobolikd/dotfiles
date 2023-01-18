# set theme
theme_gruvbox dark hard         # usage: theme_gruvbox dark/light soft/medium/hard
set theme_color_scheme gruvbox  # for bobthefish prompt


# ALIASES
## rm alias
alias rm='rm -iv'

## config fish (this file)
alias fishconfig='nvim ~/.config/fish/config.fish'

## cd aliases
alias ..='cd ..'
alias ...='cd ../..'

## update
alias update='sudo apt update && sudo apt upgrade'
alias updateall='sudo apt update && sudo apt upgrade && omf update && fisher update'

## start remote desktop
alias rd_start='sudo /etc/init.d/xrdp start && sleep 0.5 && sudo /etc/init.d/xrdp status'
alias rd_stop='sudo /etc/init.d/xrdp stop && sudo /etc/init.d/xrdp status'

## vim=nvim
alias vim='nvim'
alias v='nvim'


# tell gpg where to ask for passwd
export GPG_TTY=(tty)

# END
