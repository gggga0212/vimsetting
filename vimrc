" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"Vundle 設定(以下將列出必要的設定參數) "
set nocompatible    "be iMproved, required"
filetype off        "required

" 設定執行路徑與初始化的動作 "
" 此設定可以自行指定 Vundle 實際下載位置以及未來套件安裝位置 "
" 若不照預設位置安裝，例如欲安裝路徑是 /usr/share/vim/vim74/bundle/ "
" set rtp+=/usr/share/vim/vim74/bundle/Vundle.vim/ "
" call vundle#begin('/usr/share/vim/vim74/bundle/') "
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/Vundle.vim'
Plugin 'wesleyche/Trinity'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-scripts/taglist.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'wesleyche/SrcExpl'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'sickill/vim-monokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Lokaltog/powerline-fonts.git'
Plugin 'romainl/vim-qf'
"Plugin 'haolongzhangm/auto_update_cscope_ctags_database'
"Plugin 'vim/vim'
"Plugin 'Valloric/YouCompleteMe' "install.sh neet to be active
filetype plugin indent on
colorscheme monokai 
set t_Co=256
syntax on
set nu
set hls
set noic
set nocp
" tab setting
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
set makeprg=mmake
set errorformat+=%E%f:%l:%c:\ error:%m,%Z%m
set errorformat+=%-G%.%#
set tags=./tags,./TAGS,tags;~,TAGS;~

set cscopetag
set csto=0

if filereadable("cscope.out")
   cs add cscope.out   
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif
set cscopeverbose
set guifont=Literation_Mono_Powerline:h16
" set status line
set laststatus=2
" enable powerline-fonts
let g:airline_powerline_fonts = 1

highlight ModeMsg ctermfg=green
" Alt+數字切換tab
:nn <M-1> 1gt
:nn <M-2> 2gt
:nn <M-3> 3gt
:nn <M-4> 4gt
:nn <M-5> 5gt
:nn <M-6> 6gt
:nn <M-7> 7gt
:nn <M-8> 8gt
:nn <M-9> 9gt
:nn <M-0> :tablast<CR>
" s:找出C語言name的符號
nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR> 
" g:找出name定義的地方
nmap zg :cs find g <C-R>=expand("<cword>")<CR><CR> 
" c:找出使用name的地方
nmap zc :cs find c <C-R>=expand("<cword>")<CR><CR>
" t:找出name的字串
nmap zt :cs find t <C-R>=expand("<cword>")<CR><CR>
" e:相當於egrep功能，但速度更佳
nmap ze :cs find e <C-R>=expand("<cword>")<CR><CR>
" f:尋找檔案
nmap zf :cs find f <C-R>=expand("<cfile>")<CR><CR>
" i:尋找include此檔案的檔案
nmap zi :cs find i <C-R>=expand("<cfile>")<CR><CR>
" d:尋找name裡面使用到的函式
nmap zd :cs find d <C-R>=expand("<cword>")<CR><CR>
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
set ut=100
" NERDTree setting defaults to work around
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGlyphReadOnly = "RO"
let NERDTreeWinPos=1
"切換視窗
"左
nmap <C-H> <C-W>h 
"下
nmap <C-J> <C-W>j	
"上
nmap <C-K> <C-W>k
"右
nmap <C-L> <C-W>l

nmap <C-U> <C-W>j:call g:SrcExpl_Jump()<CR>
nmap <C-O> :call g:SrcExpl_GoBack()<CR>

map <F5> :cs k 0<CR>:!find %:p:h -name '*.c' -or -name '*.s' -or -name '*.h' -or -name '*.cpp'>cscope.files<CR>:!cscope -b -q -k -i cscope.files<CR>:cs a cscope.out<CR>	
map <F6> :!find %:p:h -name '*.c' -or -name '*.s' -or -name '*.h' -or -name '*.cpp'>cscope.files<CR>:!cscope -R -b -q -i cscope.files<CR>:cs a cscope.out<CR>
nmap <F7> :TrinityToggleAll<CR>
nmap <F8> :TrinityToggleTagList<CR>
nmap <F9> :TrinityToggleNERDTree<CR>
"nmap <F9> :NERDTree<CR>
nmap <F10> :TrinityToggleSourceExplorer<CR>
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_",
        \ "Source_Explorer"
    \ ]

" Enable/Disable the local definition searching, and note that this is not  
" guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" It only searches for a match with the keyword according to command 'gd'   
 let g:SrcExpl_searchLocalDef = 1
                                                                              
" Do not let the Source Explorer update the tags file when opening          
 let g:SrcExpl_isUpdateTags = 0
                                                                              
" Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" create/update a tags file                                                
" let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R" 
	let g:SrcExpl_updateTagsCmd = "ctags -L cscope.files"
                                                                              
" Set "<F3>" key for displaying the previous definition in the jump list    
 let g:SrcExpl_prevDefKey = "<F3>"
                                                                              
" Set "<F4>" key for displaying the next definition in the jump list        
 let g:SrcExpl_nextDefKey = "<F4>"

 " Set "<F12>" key for updating the tags file artificially                   
let g:SrcExpl_updateTagsKey = "<F12>"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_error_symbol='>e'
let g:syntastic_warning_symbol='>w'
let g:syntastic_check_on_open= 1 
let g:syntastic_check_on_wq= 0 
let g:syntastic_enable_highlighting=1
" 修改高亮的背景色, 适应主题
highlight SyntasticErrorSign guifg=white guibg=black

let g:syntastic_c_checkers=['gcc','make','oclint','clang_check']
let g:syntastic_c_compiler ='gcc'
let g:syntastic_c_compiler_options ='-Wpedantic -g'
let g:syntastic_always_populate_loc_list = 0 
let g:syntastic_auto_loc_list = 0 
