#!/bin/bash
# Diffview needs the lastest git version
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git

git clone https://github.com/gggga0212/vimsetting ~/.config/nvim
#nvim
cd ~/.config
wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz

#lazygit
# https://github.com/jesseduffield/lazygit/releases/download/v0.36.0/lazygit_0.36.0_Linux_arm64.tar.gz
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit

#zsh
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
#echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
#source ~/.zshrc


# Using Ubuntu nodejs 18.x
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install nodejs
sudo apt-get install fonts-powerline tmux pip
sudo apt-get install exuberant-ctags cscope
sudo apt-get install gcc g++ make
sudo apt-get install tree mscgen
sudo apt-get install ripgrep fd-find
sudo apt-get install python python3
sudo apt-get install cmatrix screenfetch
sudo apt-get install graphviz cflow gawk zip

git clone https://github.com/amboar/tceetree.git ~/.config/tceetree
cd ~/.config/tceetree
make
# go-lang
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install golang-go

pip install pynvim --upgrade
# clone the package
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


sudo npm install -g diff-so-fancy


# nvim comment
mkdir -p ~/.local/share/nvim/site/pack/plugins/start 
cd ~/.local/share/nvim/site/pack/plugins/start
git clone https://github.com/terrortylor/nvim-comment
cp ~/.config/nvim/gitconfig ~/.gitconfig
cp ~/.config/nvim/tmux.conf ~/.tmux.conf
cp ~/.config/nvim/zshrc ~/.zshrc

#treesitter
npm install tree-sitter-cli

#fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
# git clone https://github.com/gmarik/vundle.git ~/.config/nvim/bundle/vundle
#coc.vim
# cd ~/.config/nvim/bundle/coc.nvim
# sudo npm install
# sudo npm run-script build

# oh-my-zsh


# tmux source-file ~/.tmux.conf

#:CocInstall coc-marketplace
#:CocList marketplace
#:checkhealth
#:PackerSync

#cmd mode
#loadconfig

#fzf
#cd ~/.vim/bundle/fzf
#./install

#powerline-fonts
#cd ~/.vim/bundle/powerline-fonts
#./install.sh

#>>>>Show colors in terminal.
#vim ~/.bashrc
#force_color_prompt=yes

#>>>Show dir colors
#wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O ~/.dircolors
#vim ~/.dircolors

#To swap Caps Lock and Control.
#/etc/default/keyboard
#XKBOPTIONS="ctrl:swapcaps"

#To make Caps Lock and additional Control key.
#XKBOPTIONS="ctrl:nocaps"

#ubuntu github authentication
#curl -u username:token https://api.github.com/user

#LSP
#npm install -g typescript-language-server
#:LspInstallInfo

#LanguageClient-neovim
#cd ~/.config/nvim/bundle/LanguageClient-neovim
#bash install.sh


