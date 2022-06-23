
sudo apt-get install -y git
#nvim ubuntu
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update 
sudo apt-get install -y neovim

#install vimrc
git clone https://github.com/gggga0212/vimsetting ~/.config/nvim

# Using Ubuntu nodejs 18.x
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

#sudo install
sudo apt-get install -y fonts-powerline
sudo apt-get install -y curl
sudo apt-get install -y exuberant-ctags
sudo apt-get install -y cscope
sudo apt-get install -y npm
sudo apt-get install -y lua
sudo apt-get install -y pip
sudo apt-get install -y gcc g++ make
sudo apt-get install -y tree
sudo apt-get install -y fzf
sudo apt-get install -y ripgrep
sudo apt-get install -y python
sudo apt-get install -y python3
sudo apt-get install -y fd-find
# sudo apt-get install -y clang-tools
# sudo apt-get install -y clangd
sudo apt-get install -y cmatrix
sudo apt-get install -y screenfetch 

pip install pynvim --upgrade
# clone the package
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#:checkhealth

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone https://github.com/gmarik/vundle.git ~/.config/nvim/bundle/vundle
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

sudo apt-get install -y tmux
# oh-my-zsh
sudo apt-get install -y zsh

cp gitconfig ~/.gitconfig
cp tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
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


