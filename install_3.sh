#!/bin/bash

./install_2.sh

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit

git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
#echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
#source ~/.zshrc

curl -fsSL https://deb.nodesource.com/setup_lts.x -o nodesource_setup.sh
sudo -E bash nodesource_setup.sh
sudo apt-get install -y nodejs
sudo apt-get install -y fonts-powerline tmux pip
sudo apt-get install -y exuberant-ctags cscope
sudo apt-get install -y gcc g++ make
sudo apt-get install -y tree mscgen
sudo apt-get install -y ripgrep fd-find
sudo apt-get install -y python python3
sudo apt-get install -y cmatrix screenfetch
sudo apt-get install -y graphviz cflow gawk zip
sudo ln -s /usr/bin/python3 /usr/local/bin/python

git clone https://github.com/amboar/tceetree.git ~/.config/tceetree
cd ~/.config/tceetree
make
# go-lang
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install -y golang-go

#ydiff
git clone https://github.com/ymattw/ydiff.git
cd ydiff
./setup.py install
pip install pynvim --upgrade
# clone the package
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo npm install -g diff-so-fancy


cp ~/.config/nvim/gitconfig ~/.gitconfig
cp ~/.config/nvim/tmux.conf ~/.tmux.conf
cp ~/.config/nvim/zshrc ~/.zshrc
cp ~/.config/nvim/lz_config.yml ~/.config/lazygit/config.yml
#treesitter
npm install tree-sitter-cli

#fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# nvim comment
# mkdir -p ~/.local/share/nvim/site/pack/plugins/start 
# cd ~/.local/share/nvim/site/pack/plugins/start
# git clone https://github.com/terrortylor/nvim-comment

#ubuntu github authentication
#curl -u username:token https://api.github.com/user
