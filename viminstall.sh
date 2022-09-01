
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git

#zsh
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update 
sudo apt-get install neovim
git clone https://github.com/gggga0212/vimsetting ~/.config/nvim

git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
#p10k 
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
#echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
#source ~/.zshrc
#nvim ubuntu

git clone https://github.com/amboar/tceetree.git ~/.config/tceetree
cd ~/.config/nvim/tceetree
make

# Using Ubuntu nodejs 18.x
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install nodejs
sudo apt-get install fonts-powerline
sudo apt-get install tmux
sudo apt-get install exuberant-ctags
sudo apt-get install cscope
sudo apt-get install pip
sudo apt-get install gcc g++ make
sudo apt-get install tree fzf
sudo apt-get install ripgrep fd-find
sudo apt-get install python
sudo apt-get install python3
sudo apt-get install cmatrix screenfetch
sudo apt-get install graphviz cflow gawk zip

#sudo apt-get install curl
#sudo apt-get install fd-find
#sudo apt-get install lua
#sudo apt-get install npm
# sudo apt-get install -y clang-tools
# sudo apt-get install -y clangd
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install golang-go

pip install pynvim --upgrade
# clone the package
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone https://github.com/gmarik/vundle.git ~/.config/nvim/bundle/vundle


npm install -g diff-so-fancy

#lazygit
sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get install lazygit

# nvim comment
mkdir -p ~/.local/share/nvim/site/pack/plugins/start 
cd ~/.local/share/nvim/site/pack/plugins/start
git clone https://github.com/terrortylor/nvim-comment
cp ~/.config/nvim/gitconfig ~/.gitconfig
cp ~/.config/nvim/tmux.conf ~/.tmux.conf
cp ~/.config/nvim/zshrc ~/.zshrc

#coc.vim
cd ~/.config/nvim/bundle/coc.nvim
sudo npm install
sudo npm run-script build
#treesitter
npm install tree-sitter-cli

# oh-my-zsh


tmux source-file ~/.tmux.conf

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


