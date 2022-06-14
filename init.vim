"git config --global core.autocrlf false 
" set nocompatible    "be iMproved, required"
filetype off        "required

if has('nvim')
    let s:editor_root=expand("~/.config/nvim")
    set rtp+=~/.config/nvim/bundle/vundle/
else
    let s:editor_root=expand("~/.vim")
    set rtp+=~/.vim/bundle/vundle/
endif

call vundle#rc(s:editor_root . '/bundle')
Plugin 'gmarik/vundle.git'
Plugin 'gmarik/Vundle.vim'
" Plugin 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh',}
    Plugin 'neoclide/coc.nvim', {'branch': 'release'}
    "packer
    lua require('plugins') 
    lua require('options')

nmap <F6> :!rm -rf cscope.*<CR>
            \:!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
            \:!cscope -R -b -q -i cscope.files -f cscope.out<CR>
            \:cs reset<CR>
" \:!clangd-indexer -executor=all-TUs /path/to/project > index.yaml<CR>
nmap <F8> :!rm -rf cscope.*<CR>
            \:!find "." "../ble_stack_lib/src/ble_stack" -iname '*.c' -o -iname '*.h' 
            \-or -path "./firmware/src/config/default/ble/lib/include" -prune 
            \-or -path "./firmware/src/config/default/ble/middleware_ble" -prune 
            \-or -path "./firmware/src/config/default/ble/profile_ble" -prune 
            \-or -path "./firmware/src/config/default/ble/service_ble" -prune> cscope.files<CR>
            \:!cscope -R -b -q -i cscope.files -f cscope.out<CR>
            \:cs reset<CR>

filetype plugin indent on
" colorscheme tokyonight
syntax enable 
"tagbar
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
set ut=100

" set nocsverb
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

if filereadable("cscope.out")
    cs add cscope.out   
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif

" let g:rainbow_active = 1
let g:rainbow_conf = {
            \   'guifgs' : ['#6A5ACD', '#B22222', '#C0FF3E', '#EEC900', '#9A32CD', '#EE7600', '#98fb98', '#686868'],
            \   'ctermfgs': 'xterm-256color' == $TERM ? ['141', '196', '112', '208', '129', '166', '85', '33'] : ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
            \}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                coc-explorer                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
    let g:coc_explorer_global_presets = {
                \   '.vim': {
                    \     'root-uri': '~/.config/nvim',
                    \   },
                    \   'cocConfig': {
                        \      'root-uri': '~/.config/coc',
                        \   },
                        \   'tab': {
                            \     'position': 'tab',
                            \     'quit-on-open': v:true,
                            \   },
                            \   'tab:$': {
                                \     'position': 'tab:$',
                                \     'quit-on-open': v:true,
                                \   },
                                \   'floating': {
                                    \     'position': 'floating',
                                    \     'open-action-strategy': 'sourceWindow',
                                    \   },
                                    \   'floatingTop': {
                                        \     'position': 'floating',
                                        \     'floating-position': 'center-top',
                                        \     'open-action-strategy': 'sourceWindow',
                                        \   },
                                        \   'floatingLeftside': {
                                            \     'position': 'floating',
                                            \     'floating-position': 'left-center',
                                            \     'floating-width': 50,
                                            \     'open-action-strategy': 'sourceWindow',
                                            \   },
                                            \   'floatingRightside': {
                                                \     'position': 'floating',
                                                \     'floating-position': 'right-center',
                                                \     'floating-width': 50,
                                                \     'open-action-strategy': 'sourceWindow',
                                                \   },
                                                \   'simplify': {
                                                    \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
                                                    \   },
                                                    \   'buffer': {
                                                        \     'sources': [{'name': 'buffer', 'expand': v:true}]
                                                        \   },
                                                        \ }
    " nmap <space>eh <Cmd>CocCommand explorer --preset floating<CR>
    " nmap <space>e <Cmd>CocCommand explorer<CR>
    nmap <space>eh <Cmd>CocCommand explorer --preset simplify<CR>
    nmap <space>ev <Cmd>CocCommand explorer --preset .vim<CR>
    nmap <space>ec <Cmd>CocCommand explorer --preset cocConfig<CR>
    nmap <space>eb <Cmd>CocCommand explorer --preset buffer<CR>
endif

" hi CursorLine   cterm=NONE ctermbg=241 ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=241 ctermfg=white guibg=gray guifg=white
hi Normal ctermfg=white ctermbg=16
