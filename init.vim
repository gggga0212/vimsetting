"git config --global core.autocrlf false
" set nocompatible    "be iMproved, required"
filetype off        "required

" if has('nvim')
"     let s:editor_root=expand("~/.config/nvim")
"     set rtp+=~/.config/nvim/bundle/vundle/
" else
"     let s:editor_root=expand("~/.vim")
"     set rtp+=~/.vim/bundle/vundle/
" endif
"
" call vundle#rc(s:editor_root . '/bundle')
" Plugin 'gmarik/vundle.git'
" Plugin 'gmarik/Vundle.vim'
" " Plugin 'hari-rangarajan/ccglue'
" " Plugin 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh',}
"     Plugin 'neoclide/coc.nvim', {'branch': 'release'}
    "packer
    " lua require('plugins')
    lua require('lazynvim')
    lua require('options')

nmap <F5> :!rm -rf cscope.*<CR>
            \:!find "." -iname '*.c' -o -iname '*.h'<CR>
            \:!cscope -b -c -R<CR>
            \:!~/.config/tceetree/tceetree -V -i cscope.out<CR>
            \:!dot -Tpdf -O tceetree.out<CR>
            \:!cmd.exe /C start tceetree.out.pdf<CR>
nmap <F6> :!rm -rf cscope.*<CR>
            \:!find ./ -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
            \:!cscope -R -b -c -q -i cscope.files -f cscope.out<CR>
            \:!rm -rf tags<CR>
            \:!ctags -R<CR>
" \:!clangd-indexer -executor=all-TUs /path/to/project > index.yaml<CR>
nmap <F7> :!rm -rf cscope.*<CR>
            \:!find "./" "../ble_stack_lib/src/ble_stack" -iname '*.c' \
            \-or -path "./firmware/src/config/default/ble/lib/include" -prune \
            \-or -path "./firmware/src/config/default/ble/middleware_ble" -prune \
            \-or -path "./firmware/src/config/default/ble/profile_ble" -prune \
            \-or -path "./firmware/src/config/default/ble/service_ble" -prune> cscope.files<CR>
            \:!cscope -b -c -R<CR>
            \:!~/.config/tceetree/tceetree -V -i cscope.out<CR>
            \:!dot -Tpdf -O tceetree.out<CR>
            \:!cmd.exe /C start tceetree.out.pdf<CR>
            " \:!mimeopen -d tceetree.pdf<CR>
            " dot, neato,wwopi,circo,fdp,sfdp
nmap <F8> :!rm -rf cscope.*<CR>
            \:!cp ~/.config/nvim/rgignore .rgignore<CR>
            \:!cp ~/.config/nvim/gitattributes ../ble_stack_lib/src/ble_stack/.gitattributes<CR>
            \:!find "./" "../ble_stack_lib/src/ble_stack" -iname '*.c' -o -iname '*.h' \
            \-or -path "../ble_stack_lib/src/ble_stack/host_ble/inc/api/cxbz6" -prune \
            \-or -path "./firmware/src/config/default/ble/lib/include" -prune \
            \-or -path "./firmware/src/config/default/ble/middleware_ble" -prune \
            \-or -path "./firmware/src/config/default/ble/profile_ble" -prune \
            \-or -path "./firmware/src/config/default/ble/service_ble" -prune> cscope.files<CR>
            \:!cscope -R -b -c -q -i cscope.files -f cscope.out<CR>
            \:!rm -rf tags<CR>
            \:!ctags "./" "../ble_stack_lib/src/ble_stack" \
            \--exclude="../ble_stack_lib/src/ble_stack/host_ble/inc/api/cxbz6"\
            \--exclude="./firmware/src/config/default/ble/lib/include"\
            \--exclude="./firmware/src/config/default/ble/middleware_ble" \
            \--exclude="./firmware/src/config/default/ble/profile_ble" \
            \--exclude="./firmware/src/config/default/ble/service_ble"<CR>
nmap <F9> :!rm -rf cscope.*<CR>
            \:!cp ~/.config/nvim/rgignore .rgignore<CR>
            \:!cp ~/.config/nvim/gitattributes ../ble_stack_lib/src/ble_stack/.gitattributes<CR>
            \:!find "./" "../ble_stack_lib/src/ble_stack" -iname '*.c' -o -iname '*.h' \
            \-or -path "../ble_stack_lib/src/ble_stack/host_ble/inc/api/cxbz2_3" -prune \
            \-or -path "./firmware/src/config/default/ble/lib/include" -prune \
            \-or -path "./firmware/src/config/default/ble/middleware_ble" -prune \
            \-or -path "./firmware/src/config/default/ble/profile_ble" -prune \
            \-or -path "./firmware/src/config/default/ble/service_ble" -prune> cscope.files<CR>
            \:!cscope -R -b -c -q -i cscope.files -f cscope.out<CR>
            \:!rm -rf tags<CR>
            \:!ctags "./" "../ble_stack_lib/src/ble_stack" \
            \--exclude="../ble_stack_lib/src/ble_stack/host_ble/inc/api/cxbz2_3"\
            \--exclude="./firmware/src/config/default/ble/lib/include"\
            \--exclude="./firmware/src/config/default/ble/middleware_ble" \
            \--exclude="./firmware/src/config/default/ble/profile_ble" \
            \--exclude="./firmware/src/config/default/ble/service_ble"<CR>
filetype plugin indent on
" colorscheme tokyonight
syntax enable
"tagbar
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
set ut=100

" if has("cscope")
"     set cscopetag
"     set csto=0
"     if filereadable("cscope.out")
"         cs add cscope.out
"     elseif $CSCOPE_DB != ""
"         cs add $CSCOPE_DB
"     endif
" else
"    echo("cscope not found")
" endif

" let g:rainbow_active = 1
" let g:rainbow_conf = {
"             \   'guifgs' : ['#6A5ACD', '#B22222', '#C0FF3E', '#EEC900', '#9A32CD', '#EE7600', '#98fb98', '#686868'],
"             \   'ctermfgs': 'xterm-256color' == $TERM ? ['141', '196', '112', '208', '129', '166', '85', '33'] : ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
"             \}

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

" vim-bookmarks
" highlight BookmarkSign ctermbg=NONE ctermfg=160
" highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1

" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
" imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
set completeopt=menu,menuone,noselect
" hi CursorLine   cterm=NONE ctermbg=241 ctermfg=white guibg=darkred guifg=white
" hi CursorColumn cterm=NONE ctermbg=241 ctermfg=white guibg=gray guifg=white
hi Normal ctermfg=white ctermbg=16
" nvim-ufo
hi default link UfoPreviewSbar PmenuSbar
hi default link UfoPreviewThumb PmenuThumb
hi default link UfoFoldedEllipsis Comment

" nvim-comment
augroup set-commentstring-ag
autocmd!
autocmd BufEnter *.c,*.h :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
autocmd BufFilePost *.c,*.h :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
augroup END
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType * let b:coc_suggest_disable = 1
" autocmd WinEnter * setlocal cursorline
" autocmd WinLeave * setlocal nocursorline
" autocmd BufWritePre * :%s/\s\+$//e
map , <leader>
