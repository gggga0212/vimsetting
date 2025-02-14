"git config --global core.autocrlf false
" set nocompatible    "be iMproved, required"
filetype off        "required
    lua require('lazynvim')
    lua require('options')
map , <leader>
nmap <F6> :!rm -rf cscope.*<CR>
            \:!find "./" -iname '*.c' -o -iname '*.h' > cscope.files<CR>
            \:!cscope -R -b -c -q -i cscope.files -f cscope.out<CR>
            \:!rm -rf tags<CR>
            \:!ctags -R<CR>
            \:so $MYVIMRC<CR>
            \:echo $MYVIMRC<CR>
            \:echo "All done, so" $MYVIMRC<CR>

" bz236
nmap <leader>la :!rm -rf cscope.*<CR>
            \:!cp ~/.config/nvim/rgignore .rgignore<CR>
            \:!cp ~/.config/nvim/gitattributes ../ble_stack_lib/src/ble_stack/.gitattributes<CR>
            \:!find "./" "../ble_stack_lib/src/ble_stack" -iname '*.c' -o -iname '*.h' \
            \-or -path "./firmware/src/config/default/ble/lib/include" -prune \
            \-or -path "./fir1ware/src/config/default/ble/middleware_ble" -prune \
            \-or -path "./firmware/src/config/default/ble/profile_ble" -prune \
            \-or -path "./firmware/src/config/default/ble/service_ble" -prune> cscope.files<CR>
            \:!cscope -R -b -c -q -i cscope.files -f cscope.out<CR>
            \:!rm -rf tags<CR>
            \:!ctags "./" "../ble_stack_lib/src/ble_stack" \
            \--exclude="./firmware/src/config/default/ble/lib/include" \
            \--exclude="./firmware/src/config/default/ble/middleware_ble" \
            \--exclude="./firmware/src/config/default/ble/profile_ble" \
            \--exclude="./firmware/src/config/default/ble/service_ble"<CR>
            \:!cp ~/.config/nvim/lua/lsp/telescope_csc.lua ~/.config/nvim/lua/lsp/telescope.lua<CR>
            \:so $MYVIMRC<CR>
            \:echo "bz236 done, so" $MYVIMRC<CR>

" bz2
nmap <leader>lr :!rm -rf cscope.*<CR>
            \:!cp ~/.config/nvim/rgignore .rgignore<CR>
            \:!cp ~/.config/nvim/gitattributes ../ble_stack_lib/src/ble_stack/.gitattributes<CR>
            \:!find "./" "../ble_stack_lib/src/ble_stack" -iname '*.c' -o -iname '*.h' \
            \-or -path "../ble_stack_lib/src/inc/api/cxbz3" -prune \
            \-or -path "../ble_stack_lib/src/inc/api/cxbz6" -prune \
            \-or -path "../ble_stack_lib/src/ble_stack/middleware_ble/ble_util/cxbz3" -prune \
            \-or -path "../ble_stack_lib/src/ble_stack/middleware_ble/ble_util/cxbz6" -prune \
            \-or -path "./firmware/src/config/default/ble/lib/include" -prune \
            \-or -path "./fir1ware/src/config/default/ble/middleware_ble" -prune \
            \-or -path "./firmware/src/config/default/ble/profile_ble" -prune \
            \-or -path "./firmware/src/config/default/ble/service_ble" -prune> cscope.files<CR>
            \:!cscope -R -b -c -q -i cscope.files -f cscope.out<CR>
            \:!rm -rf tags<CR>
            \:!ctags "./" "../ble_stack_lib/src/ble_stack" \
            \--exclude="../ble_stack_lib/src/inc/api/cxbz3" \
            \--exclude="../ble_stack_lib/src/inc/api/cxbz6" \
            \--exclude="../ble_stack_lib/src/ble_stack/middleware_ble/ble_util/cxbz3" \
            \--exclude="../ble_stack_lib/src/ble_stack/middleware_ble/ble_util/cxbz6" \
            \--exclude="./firmware/src/config/default/ble/lib/include" \
            \--exclude="./firmware/src/config/default/ble/middleware_ble" \
            \--exclude="./firmware/src/config/default/ble/profile_ble" \
            \--exclude="./firmware/src/config/default/ble/service_ble"<CR>
            \:!cp ~/.config/nvim/lua/lsp/telescope_csc2.lua ~/.config/nvim/lua/lsp/telescope.lua<CR>
            \:so $MYVIMRC<CR>
            \:echo "bz2 done, so" $MYVIMRC<CR>
" bz3
nmap <leader>ls :!rm -rf cscope.*<CR>
            \:!cp ~/.config/nvim/rgignore .rgignore<CR>
            \:!cp ~/.config/nvim/gitattributes ../ble_stack_lib/src/ble_stack/.gitattributes<CR>
            \:!find "./" "../ble_stack_lib/src/ble_stack" -iname '*.c' -o -iname '*.h' \
            \-or -path "../ble_stack_lib/src/inc/api/cxbz2" -prune \
            \-or -path "../ble_stack_lib/src/inc/api/cxbz6" -prune \
            \-or -path "../ble_stack_lib/src/ble_stack/middleware_ble/ble_util/cxbz2" -prune \
            \-or -path "../ble_stack_lib/src/ble_stack/middleware_ble/ble_util/cxbz6" -prune \
            \-or -path "./firmware/src/config/default/ble/lib/include" -prune \
            \-or -path "./fir1ware/src/config/default/ble/middleware_ble" -prune \
            \-or -path "./firmware/src/config/default/ble/profile_ble" -prune \
            \-or -path "./firmware/src/config/default/ble/service_ble" -prune> cscope.files<CR>
            \:!cscope -R -b -c -q -i cscope.files -f cscope.out<CR>
            \:!rm -rf tags<CR>
            \:!ctags "./" "../ble_stack_lib/src/ble_stack" \
            \--exclude="../ble_stack_lib/src/inc/api/cxbz2" \
            \--exclude="../ble_stack_lib/src/inc/api/cxbz6" \
            \--exclude="../ble_stack_lib/src/ble_stack/middleware_ble/ble_util/cxbz2" \
            \--exclude="../ble_stack_lib/src/ble_stack/middleware_ble/ble_util/cxbz6" \
            \--exclude="./firmware/src/config/default/ble/lib/include" \
            \--exclude="./firmware/src/config/default/ble/middleware_ble" \
            \--exclude="./firmware/src/config/default/ble/profile_ble" \
            \--exclude="./firmware/src/config/default/ble/service_ble"<CR>
            \:!cp ~/.config/nvim/lua/lsp/telescope_csc3.lua ~/.config/nvim/lua/lsp/telescope.lua<CR>
            \:so $MYVIMRC<CR>
            \:echo "bz3 done, so" $MYVIMRC<CR>
" bz6
nmap <leader>ll :!rm -rf cscope.*<CR>
            \:!cp ~/.config/nvim/rgignore .rgignore<CR>
            \:!cp ~/.config/nvim/gitattributes ../ble_stack_lib/src/ble_stack/.gitattributes<CR>
            \:!find "./" "../ble_stack_lib/src/ble_stack" -iname '*.c' -o -iname '*.h' \
            \-or -path "../ble_stack_lib/src/inc/api/cxbz2" -prune \
            \-or -path "../ble_stack_lib/src/inc/api/cxbz3" -prune \
            \-or -path "../ble_stack_lib/src/ble_stack/middleware_ble/ble_util/cxbz3" -prune \
            \-or -path "../ble_stack_lib/src/ble_stack/middleware_ble/ble_util/cxbz6" -prune \
            \-or -path "./firmware/src/config/default/ble/lib/include" -prune \
            \-or -path "./fir1ware/src/config/default/ble/middleware_ble" -prune \
            \-or -path "./firmware/src/config/default/ble/profile_ble" -prune \
            \-or -path "./firmware/src/config/default/ble/service_ble" -prune> cscope.files<CR>
            \:!cscope -R -b -c -q -i cscope.files -f cscope.out<CR>
            \:!rm -rf tags<CR>
            \:!ctags "./" "../ble_stack_lib/src/ble_stack" \
            \--exclude="../ble_stack_lib/src/inc/api/cxbz2" \
            \--exclude="../ble_stack_lib/src/inc/api/cxbz3" \
            \--exclude="../ble_stack_lib/src/ble_stack/middleware_ble/ble_util/cxbz2" \
            \--exclude="../ble_stack_lib/src/ble_stack/middleware_ble/ble_util/cxbz3" \
            \--exclude="./firmware/src/config/default/ble/lib/include" \
            \--exclude="./firmware/src/config/default/ble/middleware_ble" \
            \--exclude="./firmware/src/config/default/ble/profile_ble" \
            \--exclude="./firmware/src/config/default/ble/service_ble"<CR>
            \:!cp ~/.config/nvim/lua/lsp/telescope_csc6.lua ~/.config/nvim/lua/lsp/telescope.lua<CR>
            \:so $MYVIMRC<CR>
            \:echo "bz6 done, so" $MYVIMRC<CR>

filetype plugin indent on
" colorscheme tokyonight
syntax enable
"tagbar
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
set ut=100
" vim-bookmarks
" highlight BookmarkSign ctermbg=NONE ctermfg=160
" highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
autocmd Filetype json
  \ let g:indentLine_setConceal = 0 |
  \ let g:vim_json_syntax_conceal = 0

" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
" imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
set completeopt=menu,menuone,noselect
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set listchars=tab:>·,trail:~,extends:>,precedes:<,space:␣
set list

" hi CursorLine   cterm=NONE ctermbg=241 ctermfg=white guibg=#A9A9A9 guifg=white
" hi CursorColumn cterm=NONE ctermbg=241 ctermfg=white guibg=#A9A9A9 guifg=black
" hi Normal ctermfg=white ctermbg=16
" nvim-ufo
hi default link UfoPreviewSbar PmenuSbar
hi default link UfoPreviewThumb PmenuThumb
hi default link UfoFoldedEllipsis Comment

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" autocmd WinEnter * setlocal cursorline
" autocmd WinLeave * setlocal nocursorline
" autocmd BufWritePre * :%s/\s\+$//e
" used for zM
set foldmethod=indent
