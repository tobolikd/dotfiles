#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
BLANK='\033[0m'

report(){ echo -e -n "$GREEN""$1""$BLANK"; }
ok(){ echo -e "$GREEN" --- DONE ---"$BLANK"; }
warning(){ echo ; echo -e "$RED"WARNING: "$1""$BLANK"; }


warning "This script will overwrite the following files and directories:"
echo -e "~/.gitconfig\n~/.config/nvim/init.lua\n~/.config/nvim/lua\n~/.config/fish/config.fish"
echo -ne "$RED""Do you want to continue? (y/n): ""$BLANK"

read -r

if [ "$REPLY" = "y" ] || [ "$REPLY" = "Y" ] ; then
	rm -fdr ~/.gitconfig ~/.config/nvim/init.lua ~/.config/nvim/lua ~/.config/nvim/lua/ ~/.config/fish/config.fish
elif [ "$REPLY" = "n" ] || [ "$REPLY" = "N" ] ; then
    report "Exiting the script"
    exit 1
else
	exit 1
fi


echo -n "Do you want to install dependencies? (y/n): "

read -r

if [ "$REPLY" = "y" ] || [ "$REPLY" = "Y" ] ; then
	./dependencies.sh || exit 1
elif [ "$REPLY" = "n" ] || [ "$REPLY" = "N" ] ; then
	warning "Fine, but be sure to have all dependencies installed"
else
	exit 1
fi


report "Copying git config"
cp "$PWD"/git/.gitconfig ~/ && \
ok

report "Linking nvim config"
mkdir -p ~/.config/nvim/
ln -sf "$PWD"/nvim/init.lua ~/.config/nvim/ && \
ln -sf "$PWD"/nvim/lua/ ~/.config/nvim/ && \
ok

report "Linking fish config"
mkdir -p ~/.config/fish/ && \
ln -sf "$PWD"/fish/config.fish ~/.config/fish/ && \
ok

report "Fixing gruvbox colorscheme for bobthefish"
if [[ -f ~/.local/share/omf/themes/bobthefish/functions/__bobthefish_colors.fish ]] ; then
	sed -i -e 's/\(set -x color_repo *$green\[2\] \)\($bg\[1\]\)/\1$fg[2]/g' ~/.local/share/omf/themes/bobthefish/functions/__bobthefish_colors.fish && \
	ok
else
	warning "File \"~/.local/share/omf/themes/bobthefish/functions/__bobthefish_colors.fish\" does not exist, do you have bobthefish installed?"
	echo
	echo -e "\tomf install bobthefish"
fi

echo

report "Setting up fish"
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
ok

report "----------------- ALL DONE -----------------" 

