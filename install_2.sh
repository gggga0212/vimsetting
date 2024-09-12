#!/bin/bash
#nvim
cd ~/.config
rm -rf nvim-linux64.tar.gz
rm -rf nvim-linux64.tar
wget https://github.com/neovim/neovim/releases/download/v0.10.1/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
