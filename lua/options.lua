local keymaps = vim.api.nvim_set_keymap

require "lsp.treesitter"
require "lsp.gitsigns"
require "lsp.lsp-installer"
require "lsp.lsp-config"


-- :help option
vim.opt.encoding      = 'utf-8'
vim.opt.signcolumn    = 'yes' --yes or number
vim.opt.cursorline    = true
vim.opt.cursorcolumn  = true
vim.opt.cscopetag     = true
vim.opt.nu            = true
vim.opt.hls           = true -- search and highlight word
vim.opt.smartindent   = true
-- vim.opt.autoindent    = true
vim.opt.expandtab     = true
vim.opt.ic            = true -- ignorecase
vim.opt.sm            = true -- showmatch
vim.opt.cin           = true
vim.opt.ru            = true
vim.opt.cp            = false
vim.opt.swapfile      = false
vim.opt.compatible    = false

vim.opt.shiftwidth = 4
vim.opt.tabstop    = 4
vim.opt.laststatus = 2
vim.opt.csto       = 0

vim.g.t_Co         = 256
vim.g.backspace    = 2

-- checkhealth
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- folder indent
-- vim.opt.foldmethod = 'indent'
vim.opt.foldmethod = 'syntax'
vim.opt.foldenable = false
-- winbar
vim.opt.winbar = '%m%f'

-- ctags
vim.g.tags = './tags,./TAGS,tags;~,TAGS;~'
-- ctrlp
vim.g.ctrlp_map = '<c-p>'
vim.g.ctrlp_cmd = 'CtrlP'
-- airline

-- rainbow
vim.g.rainbow_active = 1

-- vim.g.rainbow_conf = "'guifgs' : ['#6A5ACD', '#B22222', '#C0FF3E', '#EEC900', '#9A32CD', '#EE7600', '#98fb98', '#686868'],'ctermfgs': 'xterm-256color' == $TERM ? ['141', '196', '112', '208', '129', '166', '85', '33'] : ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']"

-- ctrlp setting

-- tags before find
keymaps('n','/', 'ms/',{noremap=true, silent=true})

-- vim replace keymaps('n','<C-a>',':<C-U><C-R>=printf("%%s/%s/%s",expand("<cword>"),expand("<cword>"))<CR>',{noremap=true, silent=false})

-- EasyAlign
-- Start interactive EasyAlign in visual mode (e.g. vipga)
-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
keymaps('x','ga', '<Plug>(EasyAlign)',  { noremap=true, silent=false})
keymaps('n','ga', '<Plug>(EasyAlign)_', { noremap=true, silent=false})

-- colo tokyonight
vim.g.tokyonight_style         = "night" -- available: night, storm
vim.g.tokyonight_enable_italic = 1

-- colo solarized
vim.g.solarized_italic_comments    = true
vim.g.solarized_italic_keywords    = true
vim.g.solarized_italic_functions   = true
vim.g.solarized_italic_variables   = false
vim.g.solarized_contrast           = false
vim.g.solarized_borders            = true
vim.g.solarized_disable_background = true

-- tagbar NERDTree
vim.g.NERDTreeGlyphReadOnly       = "RO"
vim.g.NERDTreeDirArrowExpandable  = '>'
vim.g.NERDTreeDirArrowCollapsible = 'v'
vim.g.NERDTreeNodeDelimiter       = ''

-- highlight
-- git diff New Lin
-- git diff Modify Line
-- git diff Delete Line
-- git diff Modify Word
-- cscope highlight in find cs
vim.cmd([[
augroup MyColors
au!
au ColorScheme * hi DiffAdd ctermbg=235 ctermfg=108 guibg=#262626 guifg=#87af87 cterm=reverse gui=reverse
au ColorScheme * hi DiffChange ctermbg=235 ctermfg=103 guibg=#262626 guifg=#8787af cterm=reverse gui=reverse
au ColorScheme * hi DiffDelete ctermbg=235 ctermfg=131 guibg=#262626 guifg=#af5f5f cterm=reverse gui=reverse
au ColorScheme * hi DiffText ctermbg=235 ctermfg=208 guibg=#262626 guifg=#ff8700 cterm=reverse gui=reverse
au ColorScheme * hi ModeMsg ctermfg=green
au ColorScheme * hi Pmenu ctermbg=240 ctermfg=white
augroup end
]])
-- cscope
-- s: Find this C symbol.
-- g: Find this definition.
-- c: Find functions calling this function.
-- t: Find this file.
-- e: Find this grep pattern.
-- f: Find this file.
-- i: Find files #including this file.
-- d: Find functions called by this function.
keymaps('n','cs','* :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>',{noremap=true, silent=true})
keymaps('n','cg','* :cs find g <C-R>=expand("<cword>")<CR><CR>:copen<CR>',{noremap=true, silent=true})
keymaps('n','cc','* :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>',{noremap=true, silent=true})
keymaps('n','ct','* :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>',{noremap=true, silent=true})
keymaps('n','ce','* :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>',{noremap=true, silent=true})
keymaps('n','cf','* :cs find f <C-R>=expand("<cword>")<CR><CR>:copen<CR>',{noremap=true, silent=true})
keymaps('n','ci','* :cs find i <C-R>=expand("<cword>")<CR><CR>:copen<CR>',{noremap=true, silent=true})
keymaps('n','cd','* :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>',{noremap=true, silent=true})
keymaps('n','cj',':<C-U><C-R>=printf("cs find ")<CR>',{noremap=true, silent=false})

vim.opt.cscopequickfix = 's-,c-,d-,i-,t-,e-,a-'
keymaps('n','cx', ':copen<CR>',  {noremap=true, silent=true})
keymaps('n','cq', ':cclose<CR>', {noremap=true, silent=true})
-- nmap <C-t> :colder<CR>:cc<CR>

-- keymaps('n','<space>eh', ':NERDTree<CR>',{noremap=true, silent=true})
keymaps('n','<space>eh', ':NERDTreeToggle<CR>', {noremap=true, silent=true})
keymaps('n','<space>el', ':TagbarToggle<CR>',   {noremap=true, silent=true})

-- cursor
keymaps('n','<Leader>c',':set cursorline! cursorcolumn!<CR>',  {noremap=true, silent=true})

-- Function Key
keymaps('n', '<F2>',':tabe ~/.config/nvim/init.vim<CR>', { noremap=true, silent=true})
keymaps('n', '<F3>',':cnext<CR>', { noremap=true, silent=true})
keymaps('n', '<F4>',':cprev<CR>', { noremap=true, silent=true})

-- keymaps('n', '<F6>',':!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
-- :!cscope -R -b -q -i cscope.files -f cscope.out<CR>
-- :cs reset<CR>',{ noremap=true, silent=true})

-- Move in vim
keymaps('n', '<C-H>','<C-W>h',{noremap=true, silent=true})
keymaps('n', '<C-J>','<C-W>j',{noremap=true, silent=true})
keymaps('n', '<C-K>','<C-W>k',{noremap=true, silent=true})
keymaps('n', '<C-L>','<C-W>l',{noremap=true, silent=true})

keymaps('n', '<C-Up>',':resize -2<CR>',             {noremap=true, silent=true})
keymaps('n', '<C-Down>',':resize +2<CR>',           {noremap=true, silent=true})
keymaps('n', '<C-Left>',':vertical resize -2<CR>',  {noremap=true, silent=true})
keymaps('n', '<C-Right>',':vertical resize +2<CR>', {noremap=true, silent=true})

-- Stay in indent mode
keymaps('v', ">",">gv",{noremap=true, silent=true})
keymaps('v', "<","<gv",{noremap=true, silent=true})

-- Move text up and down keymaps('v', '<A-j>',':m.+1<CR>==',{noremap=true, silent=true})
keymaps('v', '<A-k>',':m.-2<CR>==',{noremap=true, silent=true})
-- Visual Block
-- Move text up and down
keymaps('x', 'J',":move '>+1<CR>gv-gv",     {noremap=true, silent=true})
keymaps('x', 'K',":move '<-1<CR>gv-gv",     {noremap=true, silent=true})
keymaps('x', '<A-j>',":move '>+1<CR>gv-gv", {noremap=true, silent=true})
keymaps('x', '<A-k>',":move '<-2<CR>gv-gv", {noremap=true, silent=true})

-- floaterm
vim.g["floaterm_width"]  = 0.95
vim.g["floaterm_height"] = 0.95
keymaps('n','<space>ft',':FloatermNew<CR>',               {noremap=true, silent=true})
keymaps('t','<space>ft','<C-\\><C-n>:FloatermNew<CR>',    {noremap=true, silent=true})
keymaps('n','<space>fp',':FloatermPrev<CR>',              {noremap=true, silent=true})
keymaps('t','<space>fp','<C-\\><C-n>:FloatermPrev<CR>',   {noremap=true, silent=true})
keymaps('n','<space>fn',':FloatermNext<CR>',              {noremap=true, silent=true})
keymaps('t','<space>fn','<C-\\><C-n>:FloatermNext<CR>',   {noremap=true, silent=true})
keymaps('n','<space>ff',':FloatermToggle<CR>',            {noremap=true, silent=true})
keymaps('t','<space>ff','<C-\\><C-n>:FloatermToggle<CR>', {noremap=true, silent=true})

-- vimagit
keymaps('n','gj',':Gitsigns preview_hunk<CR>', {noremap=true, silent=true})
keymaps('n','gn',':Gitsigns next_hunk<CR>',    {noremap=true, silent=true})
keymaps('n','gp',':Gitsigns prev_hunk<CR>',    {noremap=true, silent=true})
keymaps('n','gu',':Gitsigns reset_hunk<CR>',   {noremap=true, silent=true})
keymaps('n','<space>gb',':Git blame<CR>',             {noremap=true, silent=true})
keymaps('n','<space>gl',':LazyGit<CR>',               {noremap=true, silent=true})
keymaps('n','<space>go',':DiffviewOpen -uno<CR>',     {noremap=true, silent=true})
keymaps('n','<space>gr',':DiffviewRefresh<CR>',       {noremap=true, silent=true})

keymaps('n','<space>gm',':<C-U><C-R>=printf("Gitsigns ")<CR>', { noremap=true, silent=false})
-- Telescope
keymaps('n','<space>tf',':Telescope find_files<CR>',  {noremap=true, silent=true})
keymaps('n','<space>tg',':Telescope live_grep<CR>',   {noremap=true, silent=true})
keymaps('n','<space>tt',':Telescope treesitter<CR>',  {noremap=true, silent=true})
keymaps('n','<space>th',':Neotree',                   {noremap=true, silent=true})

-- highlight
keymaps('n','<space>tr',':RainbowToggle<CR>',  {noremap=true, silent=true})
keymaps('n','<space>tz',':TSToggle highlight<CR>',  {noremap=true, silent=true})

-- Easy motion
vim.g.EasyMotion_do_mapping = 0
keymaps('n','s','<Plug>(easymotion-overwin-f2)',           { noremap=true, silent=true})
-- Move to line
keymaps('','<space>tl','<Plug>(easymotion-bd-jk)',         { noremap=true, silent=true})
keymaps('n','<space>tl','<Plug>(easymotion-overwin-line)', { noremap=true, silent=true})
-- Move to word
keymaps('','<space>tw','<Plug>(easymotion-bd-w)',          { noremap=true, silent=true})
keymaps('n','<space>tw','<Plug>(easymotion-overwin-w)',    { noremap=true, silent=true})

keymaps('','/','<Plug>(easymotion-sn)', { noremap=true, silent=true})
keymaps('o','/','<Plug>(easymotion-tn)', { noremap=true, silent=true})

-- quickhl
keymaps('n','<space>m','<Plug>(quickhl-manual-this)',  { noremap=true, silent=true})
keymaps('x','<space>m','<Plug>(quickhl-manual-this)',  { noremap=true, silent=true})
keymaps('n','<space>M','<Plug>(quickhl-manual-reset)', { noremap=true, silent=true})
keymaps('x','<space>M','<Plug>(quickhl-manual-reset)', { noremap=true, silent=true})

-- Lspsaga
keymaps('n','gh',':Lspsaga lsp_finder<CR>', {noremap=true, silent=true})

-- Command of mine

-- colo
vim.cmd [[colorscheme tokyonight]]
