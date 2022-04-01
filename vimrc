"git config --global core.autocrlf false 
set nocompatible    "be iMproved, required"
filetype off        "required
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle.git'
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
"Plugin 'Shougo/unite.vim'
"Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Yggdroot/LeaderF',{'d':'./install.sh'}
Plugin 'Yggdroot/indentLine'
"Plugin 'tacahiroy/ctrlp-funky'
Plugin 'wesleyche/Trinity'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-scripts/taglist.vim'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'https://github.com/nanotech/jellybeans.vim'
Plugin 'https://github.com/tomasr/molokai'
Plugin 'kshenoy/vim-signature'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'wesleyche/SrcExpl'
"Plugin 'wenlongche/SrcExpl'
Plugin 'BurntSushi/ripgrep'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'sickill/vim-monokai'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Lokaltog/powerline-fonts.git'
"Plugin 'haolongzhangm/auto_update_cscope_ctags_database'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'luochen1990/rainbow'
Plugin 'airblade/vim-gitgutter'
Plugin 'jreybert/vimagit'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'vim/vim'
filetype plugin indent on
colorscheme slate 
syntax on
set encoding=utf-8
setglobal fileencoding=utf-8

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
set backspace=2
set cscopetag
set csto=0
set nocsverb
" set status line
set laststatus=2
set t_Co=256
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

let g:airline_powerline_fonts = 1  
" supportted powerline front
"let g:airline_theme='moloai'  
" murmur color
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '>>'
let g:airline_left_alt_sep = '>'
let g:airline_right_sep = '<<'
let g:airline_right_alt_sep = '<'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'

"Vim-gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_removed_above_and_below = '{'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1

highlight GitGutterAdd    ctermfg=lightgreen
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
" git next
nmap gn :GitGutterNextHunk<CR>
" git previous
nmap gp :GitGutterPrevHunk<CR>
" Hunk-add and hunk-revert for chunk staging
"git add (chunk)
nmap <Leader>ga :GitGutterStageHunk<CR>
" git undo (chunk)
nmap <Leader>gu :GitGutterUndoHunk<CR>
"set updatetime=250


"vimagit
nnoremap <Leader>gs :Magit<CR>" git status
" Enable deletion of untracked files in Magit
"let g:magit_discard_untracked_do_delete=1

"vim-fugitive
" Show commits for every source line
nnoremap <Leader>gb :Gblame<CR>  " git blame
"Open current line in the browser
"nnoremap <Leader>gb :.Gbrowse<CR>
" Open visual selection in the browser
"vnoremap <Leader>gb :Gbrowse<CR>
" Add the entire file to the staging area
nnoremap <Leader>gaf :Gw<CR>  " git add file

"nerdTree
let g:NERDTreeNodeDelimiter = "\u00a0"

"gtags setting
let $GTAGSLABEL = 'native-pygments'

if filereadable("cscope.out")
   cs add cscope.out   
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif
" show msg when any other cscope db added
set cscopeverbose
set guifont=Literation_Mono_Powerline:h16
" if u do not want vim check database update when firstly load vim 
let g:check_when_first_load_vim=0
" if u do want to audo update database during edit you file
let g:auto_run_function_when_cscope_connect=1
" enable powerline-fonts
let g:airline_powerline_fonts = 1

let g:SuperTabDefaultCompletionType = "<c-n>"
"let g:SuperTabContextDefaultCompletionType = "<c-n>"
highlight ModeMsg ctermfg=green
" s: Find this C symbol.
nmap cs :cs find s <C-R>=expand("<cword>")<CR><CR>
" g: Find this definition.
nmap cg :cs find g <C-R>=expand("<cword>")<CR><CR>
" c: Find functions calling this function.
nmap cc :cs find c <C-R>=expand("<cword>")<CR><CR>
" t: Find this file.
nmap ct :cs find t <C-R>=expand("<cword>")<CR><CR>
" e: Find this grep pattern.
nmap ce :cs find e <C-R>=expand("<cword>")<CR><CR>
" f: Find this file.
nmap cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
" i: Find files #including this file.
nmap ci :cs find i <C-R>=expand("<cfile>")<CR><CR>
" d: Find functions called by this function.
nmap cd :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap cj :<C-U><C-R>=printf("cs find ")<CR>
nmap cv :<C-U><C-R>=printf("Leaderf! rg -w %s -g *.h -g *.c", expand("<cword>"))<CR><CR>

nmap <c-a> :<C-U><C-R>=printf("%%s/%s/%s",expand("<cword>"),expand("<cword>"))<CR>
map <C-i> :e %:p:s,.H$,.X123X,:s,.C$,.H,:s,.X123X$,.C,<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                     tagbar setting                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let tagbar_left=1
"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
set ut=100
" NERDTree setting defaults to work around
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'
let g:NERDTreeGlyphReadOnly = "RO"
let NERDTreeWinPos=1

nmap <C-H> <C-W>h 
nmap <C-J> <C-W>j	
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
"nmap <C-U> <C-W>u:call g:SrcExpl_Jump()<CR>
"nmap <C-O> <C-W>o:call g:SrcExpl_GoBack()<CR>


nmap <F2> :tabe ~/.vimrc<CR>
nmap <F3> :source ~/.vimrc<CR>
nmap <F4> :RainbowToggle<CR>
"nmap <F5> :cs reset<CR>
nmap <F6> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
  \:!cscope -R -b -q -i cscope.files -f cscope.out<CR>
  \:cs reset<CR>
nmap <F7> :LeaderfSelf<CR>
nmap <F8> :TrinityToggleTagList<CR>
nmap <F9> :TrinityToggleNERDTree<CR>
"nmap <F10> :SrcExplToggle<CR>
"nmap <F11> :TagbarToggle<CR>

"let g:SrcExpl_pluginList = [
"    \ "__Tag_List__",
"    \ "_NERD_tree_",
"    \ "Source_Explorer"
"    \]
"let g:SrcExpl_colorSchemeList = [
"    \ "Red",
"    \ "Cyan",
"    \ "Green",
"    \ "Yellow",
"    \ "Magenta"
"    \]
"" Enable/Disable the local definition searching, and note that this is not  
"" guaranteed to work, the Source Explorer doesn't check the syntax for now. 
"" It only searches for a match with the keyword according to command 'gd'   
"let g:SrcExpl_searchLocalDef = 1
"" Do not let the Source Explorer update the tags file when opening          
"let g:SrcExpl_isUpdateTags = 0
"" Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
"" create/update a tags file                                                
"let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R" 
""let g:SrcExpl_updateTagsCmd = "ctags -L cscope.files"
"" Set "<F3>" key for displaying the previous definition in the jump list    
" let g:SrcExpl_prevDefKey = "<F3>"
"" Set "<F4>" key for displaying the next definition in the jump list        
" let g:SrcExpl_nextDefKey = "<F4>"
" " Set "<F12>" key for updating the tags file artificially                   
"let g:SrcExpl_updateTagsKey = "<F12>"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    youCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    ctrlp setting                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                ctrlp-funky                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <Leader>fu :CtrlPFunky<Cr>
"" narrow the list down with a word under cursor
"nnoremap <Leader>uu :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
"let g:ctrlp_funky_syntax_highlight = 1
"let g:ctrlp_extensions = ['funky']
"let g:ctrlp_funky_matchtype = 'path'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"Check the code error"
let g:syntastic_error_symbol='>e'
"Check the code warning"
let g:syntastic_warning_symbol='>w'
let g:syntastic_check_on_open= 1 
let g:syntastic_check_on_wq= 0 
let g:syntastic_enable_highlighting=1
highlight SyntasticErrorSign guifg=white guibg=black

let g:syntastic_c_checkers=['gcc','make','oclint','clang_check']
let g:syntastic_c_compiler ='gcc'
let g:syntastic_c_compiler_options ='-Wpedantic -g'
let g:syntastic_always_populate_loc_list = 0 
let g:syntastic_auto_loc_list = 0 

let g:indent_guides_guide_size            = 1
let g:indent_guides_start_level           = 2

"let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs' : ['#6A5ACD', '#B22222', '#C0FF3E', '#EEC900', '#9A32CD', '#EE7600', '#98fb98', '#686868'],
    \   'ctermfgs': 'xterm-256color' == $TERM ? ['141', '196', '112', '208', '129', '166', '85', '33'] : ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
    \}
