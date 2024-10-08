"git config --global core.autocrlf false
" set nocompatible    "be iMproved, required"
filetype off        "required
    lua require('lazynvim')
    lua require('options')
nmap <F5> :!rm -rf cscope.*<CR>
            \:!find "." -iname '*.c' -o -iname '*.h'<CR>
            \:!cscope -b -c -R<CR>
            \:!~/.config/tceetree/tceetree -V -i cscope.out<CR>
            \:!dot -Tpdf -O tceetree.out<CR>
            \:!cmd.exe /C start tceetree.out.pdf<CR>
nmap <F6> :!rm -rf cscope.*<CR>
            \:!find "./" -iname '*.c' -o -iname '*.h' > cscope.files<CR>
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
"ble_stack_test_lib
nmap <F8> :!rm -rf cscope.*<CR>
            \:!cp ~/.config/nvim/rgignore .rgignore<CR>
            \:!cp ~/.config/nvim/gitattributes ../ble_stack_lib/src/ble_stack/.gitattributes<CR>
            \:!find "./" "../ble_stack_lib/src/ble_stack" -iname '*.c' -o -iname '*.h' \
            \-or -path "../ble_stack_lib/src/ble_stack/host_ble/inc/include" -prune \
            \-or -path "../ble_stack_lib/src/ble_stack/middleware_ble" -prune \
            \-or -path "../ble_stack_lib/src/ble_stack/profile_ble" -prune \
            \-or -path "../ble_stack_lib/src/ble_stack/service_ble" -prune \
            \-or -path "./firmware/src/config/default/ble/lib/include" -prune \
            \-or -path "./firmware/src/config/default/ble/middleware_ble" -prune \
            \-or -path "./firmware/src/config/default/ble/profile_ble" -prune \
            \-or -path "./firmware/src/config/default/ble/service_ble" -prune> cscope.files<CR>
            \:!cscope -R -b -c -q -i cscope.files -f cscope.out<CR>
            \:!rm -rf tags<CR>
            \:!ctags "./" "../ble_stack_lib/src/ble_stack" \
            \--exclude="../ble_stack_lib/src/ble_stack/host_ble/inc/include" \
            \--exclude="../ble_stack_lib/src/ble_stack/middleware_ble" \
            \--exclude="../ble_stack_lib/src/ble_stack/profile_ble" \
            \--exclude="../ble_stack_lib/src/ble_stack/service_ble" \
            \--exclude="./firmware/src/config/default/ble/lib/include" \
            \--exclude="./firmware/src/config/default/ble/middleware_ble" \
            \--exclude="./firmware/src/config/default/ble/profile_ble" \
            \--exclude="./firmware/src/config/default/ble/service_ble"<CR>
" Buckland MW
nmap <F9> :!rm -rf cscope.*<CR>
            \:!cp ~/.config/nvim/rgignore .rgignore<CR>
            \:!cp ~/.config/nvim/gitattributes ../ble_stack_lib/src/ble_stack/.gitattributes<CR>
            \:!find "./" "../ble_stack_lib/src/ble_stack" -iname '*.c' -o -iname '*.h' \
            \-or -path "../ble_stack_lib/src/ble_stack/host_ble/inc/include" -prune \
            \-or -path "../ble_stack_lib/src/ble_stack/middleware_ble/ble_util/cxbz3" -prune \
            \-or -path "../ble_stack_lib/src/ble_stack/middleware_ble/ble_util/cxbz6" -prune \
            \-or -path "./firmware/src/config/default/ble/lib/include" -prune \
            \-or -path "./firmware/src/config/default/ble/middleware_ble" -prune \
            \-or -path "./firmware/src/config/default/ble/profile_ble" -prune \
            \-or -path "./firmware/src/config/default/ble/service_ble" -prune> cscope.files<CR>
            \:!cscope -R -b -c -q -i cscope.files -f cscope.out<CR>
            \:!rm -rf tags<CR>
            \:!ctags "./" "../ble_stack_lib/src/ble_stack" \
            \--exclude="../ble_stack_lib/src/ble_stack/host_ble/inc/include" \
            \--exclude="../ble_stack_lib/src/ble_stack/middleware_ble/ble_util/cxbz3" \
            \--exclude="../ble_stack_lib/src/ble_stack/middleware_ble/ble_util/cxbz6" \
            \--exclude="./firmware/src/config/default/ble/lib/include" \
            \--exclude="./firmware/src/config/default/ble/middleware_ble" \
            \--exclude="./firmware/src/config/default/ble/profile_ble" \
            \--exclude="./firmware/src/config/default/ble/service_ble"<CR>
" Buckland MW
nmap <F10> :!rm -rf cscope.*<CR>
            \:!cp ~/.config/nvim/rgignore .rgignore<CR>
            \:!cp ~/.config/nvim/gitattributes ../ble_stack_lib/src/ble_stack/.gitattributes<CR>
            \:!find "./" "../ble_stack_lib/src/ble_stack" -iname '*.c' -o -iname '*.h' \
            \-or -path "../ble_stack_lib/src/ble_stack/host_ble/inc/include" -prune \
            \-or -path "../ble_stack_lib/src/ble_stack/middleware_ble/ble_util/cxbz2" -prune \
            \-or -path "../ble_stack_lib/src/ble_stack/middleware_ble/ble_util/cxbz6" -prune \
            \-or -path "./firmware/src/config/default/ble/lib/include" -prune \
            \-or -path "./firmware/src/config/default/ble/middleware_ble" -prune \
            \-or -path "./firmware/src/config/default/ble/profile_ble" -prune \
            \-or -path "./firmware/src/config/default/ble/service_ble" -prune> cscope.files<CR>
            \:!cscope -R -b -c -q -i cscope.files -f cscope.out<CR>
            \:!rm -rf tags<CR>
            \:!ctags "./" "../ble_stack_lib/src/ble_stack" \
            \--exclude="../ble_stack_lib/src/ble_stack/host_ble/inc/include" \
            \--exclude="../ble_stack_lib/src/ble_stack/middleware_ble/ble_util/cxbz2" \
            \--exclude="../ble_stack_lib/src/ble_stack/middleware_ble/ble_util/cxbz6" \
            \--exclude="./firmware/src/config/default/ble/lib/include" \
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
" vim-bookmarks
" highlight BookmarkSign ctermbg=NONE ctermfg=160
" highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1

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
map , <leader>
