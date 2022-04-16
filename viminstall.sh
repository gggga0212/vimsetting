sudo apt-get install git
sudo apt-get install curl
sudo apt-get install exuberant-ctags
sudo apt-get install cscope
sudo apt-get install npm
sudo apt-get install lua

npm install -g diff-so-fancy
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone https://github.com/gmarik/vundle.git ~/.config/nvim/bundle/vundle
git clone https://github.com/gggga0212/vimsetting.git
cd vimsetting
cp vimrc ~/.vimrc
cp vimrc ~/.config/nvim/init.vim
cp gitconfig ~/.gitconfig
cp tmux.conf ~/.tmux.conf

#coc.vim
#cd ~/.config/nvim/bundle/coc.nvim
#npm install

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

#nvim
#:checkhealth

#nvim ubuntu
#sudo add-apt-repository ppa:neovim-ppa/stable
#sudo apt-get update
#sudo apt-get install neovim
#sudo apt-get install python-dev python-pip python3-dev python3-pip
