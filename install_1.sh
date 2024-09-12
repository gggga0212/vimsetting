#!/bin/bash
# Diffview needs the lastest git version
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git

git clone https://github.com/gggga0212/vimsetting ~/.config/nvim
#zsh
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
