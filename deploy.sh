#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
BLANK='\033[0m'

report(){ echo -e -n "$GREEN""$1""$BLANK"; }
ok(){ echo -e "$GREEN" --- DONE ---"$BLANK"; }
warning(){ echo ; echo -e "$RED"WARNING: "$1""$BLANK"; }

report "Copying git config"
cp "$PWD"/git/.gitconfig ~/ && \
ok

report "Linking nvim config"
mkdir -p ~/.config/nvim/
ln -sf "$PWD"/nvim/init.lua ~/.config/nvim/ && \
ln -sf "$PWD"/nvim/lua/ ~/.config/nvim/ && \
ok

report "Linking kitty config"
mkdir -p ~/.config/kitty/
ln -sf "$PWD"/kitty/kitty.conf ~/.config/kitty/ && \
ok

report "Linking bash config"
ln -sf "$PWD"/bash/.bashrc ~/ && \
ok

report "Linking gdb config"
ln -sf "$PWD"/gdb/.gdbinit ~/ && \

report "----------------- ALL DONE -----------------"

