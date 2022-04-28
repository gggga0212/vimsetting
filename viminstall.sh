#sudo apt udpate
#sudo apt -y upgrade
#sudo apt-get install -y git

#nvim ubuntu
wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb

# Using Ubuntu nodejs 18.x
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
#cp
cp vimrc ~/.vimrc
cp vimrc ~/.config/nvim/init.vim
cp gitconfig ~/.gitconfig
cp tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf

#packer
mkdir ~/.config/nvim/lua
cp plugins.lua ~/.config/nvim/lua/plugins.lua

#sudo install
sudo apt-get install fonts-powerline
sudo apt-get install curl
sudo apt-get install exuberant-ctags
sudo apt-get install cscope
sudo apt-get install npm
sudo apt-get install lua
sudo apt-get install pip
sudo apt-get install zsh
sudo apt-get install gcc g++ make


# clone the package
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#:checkhealth

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone https://github.com/gmarik/vundle.git ~/.config/nvim/bundle/vundle
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
#zsh
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

# zsh scheme 
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
#echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
#source ~/.zshrc
sudo apt-get install -y cmatrix


#coc.vim
cd ~/.config/nvim/bundle/coc.nvim
npm install
npm run-script build

npm install -g diff-so-fancy
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#:CocInstall coc-json coc-tsserver
#:CocInstall coc-marketplace
#:CocList marketplace
#:checkhealth
#npm install -g neovim

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

