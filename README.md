# vimsetting by SamKuo
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
  1. Press Press Command+Space and type Terminal and press enter/return key.  
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
  Enter to vim  
```vim
  :PluginInstall

```
  When install Done, exit the vim and re-enter to the vim  

## If you want to uninstall the plugin function  
  Remove the vimrc Plugin root, and save the vimrc. 
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
  
  ### Final vim photo of MacOS 
![mac_vim](https://user-images.githubusercontent.com/30749497/34325970-eec21ed6-e8dc-11e7-8168-fdf6bb21be91.jpg)    
![quick_key](http://blog.vgod.tw/wp-content/uploads/2009/12/vim-cheat-sheet-full.png)

## Author
Chang-Han, Kuo

