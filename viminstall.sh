#sudo apt udpate
#sudo apt -y upgrade
#sudo apt-get install git
sudo apt-get install fonts-powerline
sudo apt-get install curl
sudo apt-get install exuberant-ctags
sudo apt-get install cscope
sudo apt-get install npm
sudo apt-get install lua
sudo apt-get install pip
sudo apt-get install zsh
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# clone the package
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#To install nodejs 12.x
udo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
#nvim
#:checkhealth
#nvim ubuntu
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
#sudo apt-get install python-dev python-pip python3-dev python3-pip

npm install -g diff-so-fancy

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone https://github.com/gmarik/vundle.git ~/.config/nvim/bundle/vundle
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
#pip3 install --user neovim
git clone https://github.com/gggga0212/vimsetting.git
cd vimsetting
cp vimrc ~/.vimrc
cp vimrc ~/.config/nvim/init.vim
cp gitconfig ~/.gitconfig
cp tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf
#zsh
#git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
#fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
#git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

# zsh scheme 
#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git 
#echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
#sudo apt-get install cmatrix

#coc.vim
#cd ~/.config/nvim/bundle/coc.nvim
#npm install
#npm build

#:CocInstall coc-json coc-tsserver
#:CocInstall coc-marketplace
#:CocList marketplace
#:checkhealth
#npm install -g neovim

#packer
#cp plugins.lua ~/.config/nvim/lua/plugins.lua


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
