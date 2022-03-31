# VIM setting by SamKuo    
![quick_key](http://blog.vgod.tw/wp-content/uploads/2009/12/vim-cheat-sheet-full.png)   
![quick_key2](http://www.viemu.com/vi-vim-cheat-sheet.gif)
## Step 0: Check the environment  
  ### The vim need the following tool, if not, please install by the following command    
#### Debian (ubuntu)  
  
  ```vim
  sudo apt-get install git  
  sudo apt-get install curl  
  sudo apt-get install exuberant-ctags  
  sudo apt-get install cscope  
  ```
#### MacOS
  1. Press Command+Space and type Terminal and press enter/return key.  
  2. Run in Terminal app:  
  ``` vim
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
  ```
  3. Run:  
  ```vim
  brew install ctags  
  brew install cscope  
  brew install git  
  ```   
#### Windows Cygwin   
  1. Cygwin download and install in https://www.cygwin.com/   
  2. Cygwin install as the following tool   
    *1. [Need for programmer] gcc, make, wget, lynx, svn, git, vim, curl   
    *2. [Need for apt-get] wget, tar, gawk, bzip2   
  3. Install the apt-cyg    
  
  ```vim    
  lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg   
  install apt-cyg /bin    
  ```   

  4. Install the cscope     
  ```vim    
  apt-cyg install cscope    
  apt-cyg install ctags   
  ```
## Step 1: Download the Vundle by git   
```vim
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle  
```

## Step 2: Overwrite the vimrc
```vim
  git clone https://github.com/gggga0212/vimsetting.git  
  cd vimsetting 
  cp vimrc ~/.vimrc 
```   
## Step 3: Install the vimrc plugin function  
  Enter to vim normal mode  
```vim    
  :PluginInstall

```
  When install Done, exit the vim and re-enter to the vim  
## Step 4: Others install   
### fzf   
```vim
cd ~/.vim/bundle/fzf    
./install
```
### powerline-fonts
```vim
cd ~/.vim/bundle/powerline-fonts    
./install.sh
```   
### auto_update_cscope_ctags_database    

python2   
```vim    
cd ~/.vim/bundle/vim    
./configure -with-features=huge --enable-rubyinterp --enable-perlinterp=yes --enable-tclinterp=yes --enable-pythoninterp=yes --enable-python=yes --with-python-config-dir=/usr/lib/python2.7/config-arm-linux-gnueabihf/    
(this dir may diff between diff pc)  
```
python3   
```vim    
cd ~/.vim/bundle/vim    
./configure -with-features=huge --enable-rubyinterp --enable-perlinterp=yes --enable-tclinterp=yes -enable-python3interp=yes --enable-python3=yes --with-python-config-dir=/usr/lib/python3.5/config-3.5m-arm-linux-gnueabihf/    
(this dir may diff between diff pc)   
```
suggest build with python2    

```vim
make -j2
sudo make install   
```   
when see the error message    
no terminal library found
checking for tgetent()... configure: error: NOT FOUND!

please install the ncurses    
on ubuntu 16.04:    
```vim    
sudo apt-get install ncurses-dev    
```
open a new terminal input command: vim --version to check vim support feature
## If you want to uninstall the plugin function  
  Remove the vimrc Plugin root, and save the vimrc. 
  Enter to vim normal mode    
  ```vim
  :PluginClean  
  ```   
## When you first time to use the vimrc 
  At the first time, please create the cscope file and tags files.    
  1. Enter to the folder you want to choose for using vim in terminal.   
  2. F6(Create the cscope.files)->F5(Load cscope)->F12(Create the tags).  
  3. Press F7 (EnDisable Trinity the SrcExpl, TagList, NERDTree when the bottom is pressed.)   
  
  Ctrl-H: left to the vim screan  
  Ctrl-J: down to the vim screan  
  Ctrl-K: up to the vim screan  
  Ctrl-L: right to the vim screan
  
  Select what folder you want to open and press "o" to open it.
## What are Plugin in vimrc 
* [airline](https://github.com/vim-airline/vim-airline): lean & mean status/tabline for vim that's light as air     
* [ctrlp](https://github.com/ctrlpvim/ctrlp.vim) : Active fork of kien/ctrlp.vim—Fuzzy file, buffer, mru, tag, etc finder.   
* [ctrlp-funky](https://github.com/tacahiroy/ctrlp-funky) : Active fork of kien/ctrlp.vim—Fuzzy file, buffer, mru, tag, etc finder.  
    * [ctrlp Chinese](http://www.wklken.me/posts/2015/06/07/vim-plugin-ctrlp.html#shi-yong)   
* [multiple-cursors](https://github.com/terryma/vim-multiple-cursors) :True Sublime Text style multiple selections for Vim.   
* [auto_update_cscope_ctags_database](https://github.com/haolongzhangm/auto_update_cscope_ctags_database) :Auto update cscops and tags.   
* [bufexplorer](https://github.com/jlanzarotta/bufexplorer) :BufExplorer Plugin for Vim.    
* [fzf](https://github.com/junegunn/fzf): A command-line fuzzy finder   
    * [fzf Chinese](https://segmentfault.com/a/1190000011328080) :   
* [vim-monokai](https://github.com/sickill/vim-monokai): Monokai color scheme for Vim converted from Textmate theme
* [Nerd Tree](https://github.com/scrooloose/nerdtree): A tree explorer plugin for navigating the filesystem.  
* [NERDCommenter](https://github.com/scrooloose/nerdcommenter): Vim plugin for intensely orgasmic commenting  
* [powerline-fonts.git](https://github.com/Lokaltog/powerline-fonts.git): Patched fonts for Powerline users. 
* [SrcExpl](https://github.com/wesleyche/SrcExpl): the Source code Explorer which works like the context window of "Source Insight" 
* [UltIsSnips](https://github.com/SirVer/ultisnips): UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips! 
* [Snippets](https://github.com/honza/vim-snippets): vim-snipmate default snippets (Previously snipmate-snippets) 
* [SuperTab](https://github.com/ervandew/supertab): Perform all your vim insert mode complete with tab  
* [TagList](https://github.com/vim-scripts/taglist.vim): The "Tag List" plugin is a source code browser for the Vim editor. 
* [Trinity](https://github.com/trinityrnaseq/trinityrnaseq): the Trinity of taglist, NERDtree and SrcExpl: an IDE works like "Source Insight"   

## how to init the airline in macOS
```vim
cd ~/.vim/bundle/powerline-fonts  
./install.sh
```
And need to add the terminal's fonts as Meslo LG M  

![default](https://user-images.githubusercontent.com/30749497/34326391-acd11712-e8e5-11e7-9664-31089cd9eac1.jpeg) 

## Functin: Keyboard Function for Fn key  
  F3: Previous select for SrcExpl  
  F4: Next select for SrcExpl  
  F5: Load the cscope  
  F6: Ceate the cscope.files  
  F7: EnDisable Trinity the SrcExpl, TagList, NERDTree when the bottom is pressed.    
  F8: EnDisable the TagList  
  F9: EnDisable the NERDTree  
  F10: EnDisable the SrcExpl    
  F12: Create the tags  
  
  Ctrl-H: left to the vim screan  
  Ctrl-J: down to the vim screan  
  Ctrl-K: up to the vim screan  
  Ctrl-L: right to the vim screan   
  Ctrl-O: Jump to SrcExpl screan  
  ### cscope find cmd
  cs: 's'   symbol: find all references to the token under cursor.  
  cg: 'g'   global: find global definition(s) of the token under cursor.  
  cc: 'c'   calls:  find all calls to the function name under cursor.   
  ct: 't'   text:   find all instances of the text under cursor.   
  ce: 'e'   egrep:  egrep search for the word under cursor.    
  cf: 'f'   file:   open the filename under cursor.   
  ci: 'i'   includes: find files that include the filename under cursor.   
  cd: 'd'   called: find functions that function under cursor calls.  
  ### ctrlp   
  leader+f 模糊搜尋最近打開的文件    
  leader+p 模糊搜尋此目錄及子目錄的文件
  搜索框出來後，輸入關鍵字，然後可以下列指令打開文件   
  ctrl + j/k 進行上下的選擇    
  ctrl + x 在當前窗口水平分屏打開文件    
  ctrl + v 同上, 垂直分屏打開文件   
  ctrl + t 在tab 中打開文件   
  ### ctrlp-funky   
  leader+fu 進入當前文件的function列表搜索    
  ### vim basic mark    
  m 創見標記    
  ' 移動到標記的文本行首    
  ` 移動到標記的光標位置    
  :marks 列示所有標記   
  :delmarks 刪除指定標記。例：:delmarks a b c 可以指定或刪除多標記   
  :delmarks! 刪除所有標記   
  ### Windows vimrc setting SOP
  * [WIN](https://www.jianshu.com/p/3e3f881bb5bd) : Windows setting for vim.    
  
  ### Final vim photo of MacOS 
![mac_vim](https://user-images.githubusercontent.com/30749497/34325970-eec21ed6-e8dc-11e7-8168-fdf6bb21be91.jpg)    

## NICE REFERENCE   
[BASIC VIM CMD](http://blog.jex.tw/blog/2013/05/15/vim/)

## Terminal color
How to show colors in terminal. (ubuntu)
```vim
vim ~/.bashrc
force_color_prompt=yes
```
```vim
wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O ~/.dircolors
vim ~/.dircolors
```
## autoCrlf
```vim
git config --global core.autocrlf true
git config --global core.autocrlf false
```
## diff-so-fancy
```vim
sudo apt-get install npm
npm install -g diff-so-fancy
```
## gitconfig
```vim
[core]
    editor = vim
    autocrlf = true
[alias]
    co = checkout
    st = status
    br = branch -a
    ls = log --stat --graph
    sub = submodule
```
## To config keyboard.
vim /etc/default/keyboard
## To swap Caps Lock and Control.
XKBOPTIONS="ctrl:swapcaps"
## To make Caps Lock an additional Control key
XKBOPTIONS="ctrl:nocaps"

then reboot



## Author
Chang-Han, Kuo

