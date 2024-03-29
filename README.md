[![CC BY 4.0][cc-by-shield]][cc-by]
# dotfiles
Deploy dotfiles (dependencies can be installed during deploy process)
```
git clone https://github.com/NobodySpy/dotfiles.git
cd dotfiles
./deploy.sh
```

Various dotfiles for fish, nvim, etc

Install commands and scripts use `apt` as package manager. Tested on Ubuntu, should be compatible with all Debian distros.

Inspired by:
 - https://github.com/ThePrimeagen/.dotfiles
 - https://github.com/NeuralNine/config-files/blob/master/init.vim
 - https://github.com/tuffgniuz/nvim.lua
 - https://www.youtube.com/watch?v=DogKdiRx7ls
 - https://www.youtube.com/watch?v=JWReY93Vl6g
 - https://www.youtube.com/watch?v=qb6fPgZMRF4


Can be distributed freely under [Creative Commons Attribution 4.0 International License][cc-by]

# Requirements
## git
### [git itself](https://github.com/git/git)
```
sudo apt install git
```

### [gpg](https://gnupg.org/)
```
sudo apt install gpg
```

### [meld](https://meldmerge.org/)
```
sudo apt install meld
```

## neovim
### [neovim itself](https://github.com/neovim/neovim)
If you don't need newer version, install via package managaer
```
sudo apt install neovim
```
WARNING: some plugins require version 0.7.0. The package manager provides much lower version (0.4.x)
You can [build it](https://github.com/neovim/neovim/wiki/Building-Neovim)
```
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
git checkout stable
sudo make install
```
...or try other methods listed [here](https://www.reddit.com/r/neovim/comments/f9661m/how_do_i_install_the_latest_version_of_neovim_on/)

### [packer](https://github.com/wbthomason/packer.nvim)
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
Run :PackerSync in nvim to dowload all plugins

Other tools are required by the plugins like git, curl, ...

For lsp servers you need to have lts version of nodejs
```
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
```

### Keyboard layout
```
cp custom /usr/share/X11/xkb/symbols/
```

# TODO
Add install script for auto symlink

[![CC BY 4.0][cc-by-image]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg
