sudo apt-get install git  
sudo apt-get install curl  
sudo apt-get install exuberant-ctags  
sudo apt-get install cscope  
sudo apt-get install npm

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone https://github.com/gggga0212/vimsetting.git  
cd vimsetting 
cp vimrc ~/.vimrc
cp gitconfig ~/.gitconfig

#fzf
#cd ~/.vim/bundle/fzf
#./install

#powerline-fonts
#cd ~/.vim/bundle/powerline-fonts
#./install.sh

#>>>>Show colors in terminal.
#vim ~/.bashrc
#force_color_prompt=yes

#>>>Show dir colors.
#wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O ~/.dircolors
#vim ~/.dircolors

