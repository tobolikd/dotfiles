#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
BLANK='\033[0m'

report(){ echo -e "$GREEN""$INDENT""$1""$BLANK"; INDENT+="    "; }
ok(){ INDENT=$(echo "$INDENT" | cut -c 5-); echo -e "$GREEN""$INDENT"--- DONE ---"$BLANK"; echo; }
warning(){ echo ; echo -e "$RED"WARNING: "$1""$BLANK"; }

all=(git meld gpg neovim packer fish omf bobthefish fisher fish-gruvbox neofetch)

report "Installing dependencies"

report "Updating packages"
sudo apt update && sudo apt upgrade -y
ok

report "Cleaning build directories"
rm -fr *build
ok

omf-install()
{
    mkdir fish-build
    cd fish-build

    rm -fr ~/.local/share/omf

    report "Installing oh-my-fish"

    git clone https://github.com/oh-my-fish/oh-my-fish
    cd oh-my-fish
    bin/install --offline --noninteractive

    cd ../..
    ok
}

packer-install()
{
    rm -fr ~/.local/share/nvim/site/pack/packer/start/packer.nvim 
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    ok
}


for i in "${!all[@]}"; do
	case "${all[$i]}" in

	"neovim")
	report "Installing nvim build requirements"
		sudo apt -y install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
	ok

	report "Building neovim...this might take some time"
	
	mkdir -p nvim-build
	cd nvim-build
	git clone https://github.com/neovim/neovim
	cd neovim 
	git checkout stable
    make CMAKE_BUILD_TYPE=RelWithDebInfo
	sudo make install
	cd ../..
	
	ok
	;;

	"packer")
    report "Installing packer"
    if [[ -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]] ; then
        warning "Packer found on path ~/.local/share/nvim/site/pack/packer/start/packer.nvim"
        echo -n "Do you want to Reinstall packer of Continue with current installation (R/C): "
        read -r
        case "$REPLY" in
            "r" | "R")
                packer-install
                ;;
            "c" | "C")
                ;;
            *)
                exit 1
                ;;
        esac
    else
        packer-install
        git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
        ok
    fi
	;;

	"fish")
    report "Installing fish build requirements"
    sudo apt install -y libncurses5-dev libncursesw5-dev g++ cmake
    ok

	report "Building fish...this might take some time"
	mkdir fish-build
	cd fish-build
	git clone https://github.com/fish-shell/fish-shell.git
	cd fish-shell
	cmake .
	make
	sudo make install
	cd ../..
	ok
	;;

	"omf")
    if [[ -d ~/.local/share/omf ]] ; then
        warning "OMF found in ~/.local/share/omf"
        echo -n "Do you want to Reinstall omf of Continue with current installation (R/C): "
        read -r
        case "$REPLY" in
            "r" | "R")
                omf-install
                ;;
            "c" | "C")
                ;;
            *)
                exit 1
                ;;
        esac
    else
        omf-install
    fi
    ;;

	"bobthefish")
	report "Installing bobthefish theme"
    echo "omf install bobthefish" | fish
	ok
	;;

	"fisher")
	report "Installing fisher"
	echo 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher' | fish
	ok
	;;

	"fish-gruvbox")
	report "Installing gruvbox theme for fish"
    echo 'fisher install jomik/fish-gruvbox' | fish
	ok
	;;

	*)
	report "Installing ${all[$i]}"
	sudo apt install -y "${all[$i]}"
	ok
	;;
esac
done
ok
