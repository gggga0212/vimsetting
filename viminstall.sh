
sudo apt-get install git
sudo apt-get install tmux
sudo apt-get install zsh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#install vimrc
git clone https://github.com/gggga0212/vimsetting ~/.config/nvim

#nvim ubuntu
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update 
sudo apt-get neovim

# Using Ubuntu nodejs 18.x
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

cp gitconfig ~/.gitconfig
cp tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf

#sudo install
sudo apt-get install fonts-powerline
sudo apt-get install curl
sudo apt-get install exuberant-ctags
sudo apt-get install cscope
sudo apt-get install npm
sudo apt-get install lua
sudo apt-get install pip
sudo apt-get install gcc g++ make
sudo apt-get install tree
sudo apt-get install fzf
sudo apt-get install ripgrep
sudo apt-get install python
sudo apt-get install python3
sudo apt-get install fd-find
sudo apt-get install clang-tools
sudo apt-get install clangd

pip install pynvim --upgrade
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
#p10k 
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
#echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
#source ~/.zshrc
sudo apt-get install cmatrix
sudo apt-get install screenfetch 

npm install -g diff-so-fancy
#lazygit
sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get install lazygit

# nvim comment
mkdir -p ~/.local/share/nvim/site/pack/plugins/start 
cd ~/.local/share/nvim/site/pack/plugins/start
git clone https://github.com/terrortylor/nvim-comment
#coc.vim
cd ~/.config/nvim/bundle/coc.nvim
npm install
npm run-script build
#treesitter
npm install tree-sitter-cli
#:CocInstall coc-json coc-tsserver
#:CocInstall coc-marketplace
#:CocList marketplace
#:checkhealth
#:PackerSync

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


