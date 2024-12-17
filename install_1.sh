#!/bin/bash
# Diffview needs the lastest git version
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install -y wget git
sudo apt-get install -y curl zsh

git clone https://github.com/gggga0212/vimsetting ~/.config/nvim
cd ~/.config/nvim
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
./install_3.sh
