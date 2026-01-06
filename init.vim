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
