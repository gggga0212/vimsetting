"git config --global core.autocrlf false 
set nocompatible    "be iMproved, required"
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
Plugin 'vim-scripts/a.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
"Plugin 'Shougo/unite.vim'
"Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Yggdroot/LeaderF',{'d':'./install.sh'}
Plugin 'Yggdroot/indentLine'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'wesleyche/Trinity'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-scripts/taglist.vim'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'https://github.com/nanotech/jellybeans.vim'
Plugin 'https://github.com/tomasr/molokai'
Plugin 'hzchirs/vim-material'
Plugin 'kshenoy/vim-signature'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'BurntSushi/ripgrep'
"Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'sickill/vim-monokai'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Lokaltog/powerline-fonts.git'
Plugin 'luochen1990/rainbow'
"Plugin 'airblade/vim-gitgutter'
Plugin 'jreybert/vimagit'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'bootleq/vim-gitdiffall'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'voldikss/vim-floaterm'
Plugin 'kdheepak/lazygit.nvim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/vim-easy-align'

if has('nvim')
    Plugin 'neoclide/coc.nvim', {'branch': 'release'}
    "packer
    lua require('plugins') 
    lua require('init') 
nmap <F2> :tabe ~/.config/nvim/init.vim<CR>
    nmap <F3> :tabe ~/.config/nvim/lua/plugins.lua<CR>
else
    nmap <F2> :tabe ~/.vimrc<CR>
endif
    nmap <F4> :RainbowToggle<CR>
    "<F5>
    nmap <F6> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
      \:!cscope -R -b -q -i cscope.files -f cscope.out<CR>
      \:cs reset<CR>
    nmap <F7> :LeaderfSelf<CR>

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

"Remove auto comment
set formatoptions-=cro
au BufEnter * set fo-=c fo-=r fo-=o
"Vim-gitgutter
"let g:gitgutter_sign_added = '+'
"let g:gitgutter_sign_modified = '>'
"let g:gitgutter_sign_removed = '-'
"let g:gitgutter_sign_removed_first_line = '^'
"let g:gitgutter_sign_removed_above_and_below = '{'
"let g:gitgutter_sign_modified_removed = '<'
"let g:gitgutter_override_sign_column_highlight = 1

"let g:indentLine_setColors = 2 
"let g:indentLine_defaultGroup = 'SpecialKey'
"let g:indentLine_color_term = 225
"let g:indentLine_char = 'c'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" highlight GitGutterAdd    ctermfg=lightgreen
" highlight GitGutterChange ctermfg=yellow
" highlight GitGutterDelete ctermfg=red

" Hunk-add and hunk-revert for chunk staging
"git add (chunk)
"nmap <Leader>ga :GitGutterStageHunk<CR>
" git undo (chunk)
"nmap <Leader>gu :GitGutterUndoHunk<CR>
"set updatetime=250


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

" nnoremap * 
"     \ :exec("cs find s ".expand("<cword>"))<CR> 
"     \ :copen<CR> 

nnoremap / ms/

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)_
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

nmap <C-Up> :resize -2<CR> 
nmap <C-Down> :resize +2<CR>
nmap <C-Left> :vertical resize -2<CR>
nmap <C-Right> :vertical resize +2<CR>

" Stay in indent mode
vmap > >gv
vmap < <gv

" Move text up and down
vmap <A-j> :m.+1<CR>==
vmap <A-k> :m.-2<CR>==

" Visual Block
" Move text up and down
xmap J :move '>+1<CR>gv-gv
xmap K :move '<-1<CR>gv-gv
xmap <A-j> :move '>+1<CR>gv-gv
xmap <A-k> :move '<-2<CR>gv-gv


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
"git diff New Line
hi DiffAdd    ctermbg=235  ctermfg=108  guibg=#262626 guifg=#87af87 cterm=reverse gui=reverse
"git diff Modify Line
hi DiffChange ctermbg=235  ctermfg=103  guibg=#262626 guifg=#8787af cterm=reverse gui=reverse
"git diff Delete Line
hi DiffDelete ctermbg=235  ctermfg=131  guibg=#262626 guifg=#af5f5f cterm=reverse gui=reverse
"git diff Modify Word
hi DiffText   ctermbg=235  ctermfg=208  guibg=#262626 guifg=#ff8700 cterm=reverse gui=reverse

if has('nvim')
"coc.nvim setting start >>
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim

" TextEdit might fail if hidden is not set. set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

"yes or number
set signcolumn=yes

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"coc.nvim setting end <<
endif
"
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

" Use preset argument to open it
"nmap <space>eh <Cmd>CocCommand explorer --preset floating<CR>
"nmap <space>e <Cmd>CocCommand explorer<CR>
nmap <space>eh <Cmd>CocCommand explorer --preset simplify<CR>
nmap <space>ev <Cmd>CocCommand explorer --preset .vim<CR>
nmap <space>ec <Cmd>CocCommand explorer --preset cocConfig<CR>
nmap <space>eb <Cmd>CocCommand explorer --preset buffer<CR>
nmap <space>ei <Cmd>CocList explPresets<CR>

nmap <space>el <Cmd>TagbarToggle<CR>
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                checkhealth
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                hi Pmenu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"hi Pmenu ctermbg=black ctermfg=white
hi Pmenu ctermbg=240 ctermfg=white

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    ctrlp setting                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<space>tp'
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
nnoremap <Leader>fu :CtrlPFunky<Cr>
"" narrow the list down with a word under cursor
nnoremap <Leader>uu :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_matchtype = 'path'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  hightlight that moves with the cursor
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline
set cursorcolumn
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  floaterm
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap   <silent>   <space>ft    :FloatermNew<CR>
tnoremap   <silent>   <space>ft    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <space>fp    :FloatermPrev<CR>
tnoremap   <silent>   <space>fp    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <space>fn    :FloatermNext<CR>
tnoremap   <silent>   <space>fn    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <space>ff    :FloatermToggle<CR>
tnoremap   <silent>   <space>ff    <C-\><C-n>:FloatermToggle<CR>

nmap <space>ts <Cmd>so %<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               setup mapping to call :LazyGit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vimagit
nmap <space>gb :Git blame<CR>
nmap <space>gs :Magit<CR>
nmap <space>ga :Gw<CR>  " git add file

nmap <space>gl <Cmd>LazyGit<CR>
"Diffview
nmap <space>go <Cmd>DiffviewOpen -uno<CR>
nmap <space>gr <Cmd>DiffviewRefresh<CR>
nmap <space>gm :<C-U><C-R>=printf("Gitsigns ")<CR>

nmap gj :Gitsigns preview_hunk<CR>
nmap gn :Gitsigns next_hunk<CR>
nmap gp :Gitsigns prev_hunk<CR>
nmap gu :Gitsigns reset_hunk<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               Telescope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <space>tf <Cmd>Telescope find_files<CR>
nmap <space>tt <Cmd>Telescope treesitter<CR>
nmap <space>tm :<C-U><C-R>=printf("Telescope ")<CR>

nmap <space>th <Cmd>Neotree<CR>
