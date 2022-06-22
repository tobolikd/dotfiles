[![CC BY 4.0][cc-by-shield]][cc-by]
# dotfiles
Various dotfiles for fish, nvim, etc

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
WARNING: plugin `telescope` requires version 0.7.0. The package manager provides much lower version (0.4.x)
You can [build it](https://github.com/neovim/neovim/wiki/Building-Neovim)
```
git clone https://github.com/neovim/neovim
git checkout stable
sudo make install
```
...or try other methods listed [here](https://www.reddit.com/r/neovim/comments/f9661m/how_do_i_install_the_latest_version_of_neovim_on/)

### [vim-plug](https://github.com/junegunn/vim-plug)
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

After configuring the dotfile run `PlugInstall` in vim (before installing plugins, some errors might occur)

Other tools are required by the plugins like git, curl, ...

## fish shell
### [fish shell itself](https://github.com/fish-shell/fish-shell)
```
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
```

### [oh my fish](https://github.com/oh-my-fish/oh-my-fish)
```
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```

### [bobthefish theme](https://github.com/oh-my-fish/theme-bobthefish)

```
omf install bobthefish
```
This will also set bobthefish as default fish theme

#### Optional colorcheme fix
In `~/.local/share/omf/themes/bobthefish/functions/__bobthefish_colors.fish` change under `case 'gruvbox'`
```
      set -x color_repo                     $green[2] $bg[1]
```
to
```
      set -x color_repo                     $green[2] $fg[2]
```

### [fisher plugin manager](https://github.com/jorgebucaran/fisher)
```
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```

### [fish gruvbox theme](https://github.com/Jomik/fish-gruvbox)
```
fisher install jomik/fish-gruvbox
```

### [neofetch](https://github.com/dylanaraps/neofetch)
```
sudo apt install neofetch
```

# TODO
Add install script for auto symlink

[![CC BY 4.0][cc-by-image]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg
