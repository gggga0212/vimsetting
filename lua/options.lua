local keymaps = vim.api.nvim_set_keymap
local ntst = {noremap=true, silent=true}
local ntsf = {noremap=true, silent=false}

require "lsp.treesitter"
require "lsp.gitsigns"
require "lsp.lsp-installer"
require "lsp.lsp-config"
require "lsp.telescope"
-- require "lsp.nvim-bqf"
-- require "lsp.winbar"


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

-- folder indent vim.opt.foldmethod = 'indent' vim.opt.foldmethod = 'syntax'
vim.opt.foldenable = false
-- winbar
-- vim.opt.winbar = '%m%f'
vim.opt.winbar = "%{%v:lua.require'lsp.winbar'.eval()%}"
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
keymaps('n','/', 'ms/',ntst)

-- vim replace
keymaps('n','<C-a>',':<C-U><C-R>=printf("%%s/%s/%s",expand("<cword>"),expand("<cword>"))<CR>',ntsf)

-- EasyAlign
-- Start interactive EasyAlign in visual mode (e.g. vipga)
-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
keymaps('x','ga', '<Plug>(EasyAlign)',  ntsf)
keymaps('n','ga', '<Plug>(EasyAlign)_', ntsf)

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
keymaps('n','cs','* :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>',ntst)
keymaps('n','cg',':cs find g <C-R>=expand("<cword>")<CR><CR>',ntst)
keymaps('n','cc','* :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>',ntst)
keymaps('n','ct','* :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>',ntst)
keymaps('n','ce','* :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>',ntst)
keymaps('n','cf','* :cs find f <C-R>=expand("<cword>")<CR><CR>:copen<CR>',ntst)
keymaps('n','ci','* :cs find i <C-R>=expand("<cword>")<CR><CR>:copen<CR>',ntst)
keymaps('n','cd','* :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>',ntst)
keymaps('n','cj',':<C-U><C-R>=printf("cs find ")<CR>',ntsf)

-- surround
vim.g.surround_no_mappings = 1
-- keymaps('n','cs', '<Plug>Csurround',ntsf)
-- keymaps('n','cS', '<Plug>CSurround',ntsf)
keymaps('n','cz', '<Plug>Csurround',ntsf)
keymaps('n','cZ', '<Plug>CSurround',ntsf)
keymaps('n','ds', '<Plug>Dsurround',ntsf)
keymaps('n','ys', '<Plug>Ysurround',ntsf)
keymaps('n','yS', '<Plug>YSurround',ntsf)
keymaps('n','yss','<Plug>Yssurround',ntsf)
keymaps('n','ySs','<Plug>YSsurround',ntsf)
keymaps('n','ySS','<Plug>YSsurround',ntsf)
-- cscope
vim.opt.cscopequickfix = 's-,c-,d-,i-,t-,e-,a-'
keymaps('n','cx', ':copen<CR>',  ntst)
keymaps('n','cq', ':cclose<CR>', ntst)
-- keymaps( 'n','<C-t>', ':colder<CR>:cc<CR>', ntst)

-- keymaps('n','<space>eh', ':NERDTree<CR>',ntst)
-- keymaps('n','<space>eh', ':NERDTreeToggle<CR>', ntst)
keymaps('n','<space>el', ':TagbarToggle<CR>',   ntst)

-- cursor
keymaps('n','<Leader>c',':set cursorline! cursorcolumn!<CR>',  ntst)

-- Function Key
keymaps('n', '<F2>',':tabe ~/.config/nvim/init.vim<CR>', ntst)
keymaps('n', '<F3>',':cnext<CR>', ntst)
keymaps('n', '<F4>',':cprev<CR>', ntst)
keymaps('n', '<F5>',':RainbowToggle<CR>', ntst)

-- keymaps('n', '<F6>',':!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
-- :!cscope -R -b -q -i cscope.files -f cscope.out<CR>
-- :cs reset<CR>',ntst)

-- Move in vim
keymaps('n', '<C-H>','<C-W>h',ntst)
keymaps('n', '<C-J>','<C-W>j',ntst)
keymaps('n', '<C-K>','<C-W>k',ntst)
keymaps('n', '<C-L>','<C-W>l',ntst)

keymaps('n', '<C-Up>',':resize -2<CR>',             ntst)
keymaps('n', '<C-Down>',':resize +2<CR>',           ntst)
keymaps('n', '<C-Left>',':vertical resize -2<CR>',  ntst)
keymaps('n', '<C-Right>',':vertical resize +2<CR>', ntst)

-- Stay in indent mode
keymaps('v', ">",">gv",ntst)
keymaps('v', "<","<gv",ntst)

-- Move text up and down keymaps('v', '<A-j>',':m.+1<CR>==',ntst)
keymaps('v', '<A-k>',':m.-2<CR>==',ntst)
-- Visual Block
-- Move text up and down
keymaps('x', 'J',":move '>+1<CR>gv-gv",     ntst)
keymaps('x', 'K',":move '<-1<CR>gv-gv",     ntst)
keymaps('x', '<A-j>',":move '>+1<CR>gv-gv", ntst)
keymaps('x', '<A-k>',":move '<-2<CR>gv-gv", ntst)

-- floaterm
vim.g["floaterm_width"]  = 0.95
vim.g["floaterm_height"] = 0.95
keymaps('n','<space>ft',':FloatermNew<CR>',               ntst)
keymaps('t','<space>ft','<C-\\><C-n>:FloatermNew<CR>',    ntst)
keymaps('n','<space>fp',':FloatermPrev<CR>',              ntst)
keymaps('t','<space>fp','<C-\\><C-n>:FloatermPrev<CR>',   ntst)
keymaps('n','<space>fn',':FloatermNext<CR>',              ntst)
keymaps('t','<space>fn','<C-\\><C-n>:FloatermNext<CR>',   ntst)
keymaps('n','<space>ff',':FloatermToggle<CR>',            ntst)
keymaps('t','<space>ff','<C-\\><C-n>:FloatermToggle<CR>', ntst)

-- vimagit
keymaps('n','gj',':Gitsigns preview_hunk<CR>', ntst)
keymaps('n','gn',':Gitsigns next_hunk<CR>',    ntst)
keymaps('n','gp',':Gitsigns prev_hunk<CR>',    ntst)
keymaps('n','gu',':Gitsigns reset_hunk<CR>',   ntst)
keymaps('n','<space>gb',':Git blame<CR>',             ntst)
keymaps('n','<space>gl',':LazyGit<CR>',               ntst)
keymaps('n','<space>go',':DiffviewOpen -uno<CR>',     ntst)
keymaps('n','<space>gr',':DiffviewRefresh<CR>',       ntst)

keymaps('n','<space>gm',':<C-U><C-R>=printf("Gitsigns ")<CR>', ntsf)
-- Telescope
keymaps('n','<space>tf',':Telescope find_files<CR>', ntst)
-- keymaps('n','<space>tg',':Telescope live_grep<CR>',   ntst)
keymaps('n','<space>tg',':lua require("telescope").extensions.live_grep_raw.live_grep_raw()<CR>',   ntst)
keymaps('n','<space>tt',':Telescope treesitter<CR>',  ntst)
keymaps('n','<space>th',':Neotree',                   ntst)
keymaps('n','<space>tp',':lua require("telescope").extensions.project.project{}<CR>', ntst)
-- highlight
keymaps('n','<space>tz',':TSToggle highlight<CR>',ntst)
keymaps('n','<space>tq',':LspStop<CR>', ntst)
keymaps('n','<space>ti','gg=G', ntst)
-- Easy motion
vim.g.EasyMotion_do_mapping = 0
keymaps('n','s','<Plug>(easymotion-overwin-f2)',           ntst)
-- Move to line
keymaps('','<space>tl','<Plug>(easymotion-bd-jk)',         ntst)
keymaps('n','<space>tl','<Plug>(easymotion-overwin-line)', ntst)
-- Move to word
keymaps('','<space>tw','<Plug>(easymotion-bd-w)',          ntst)
keymaps('n','<space>tw','<Plug>(easymotion-overwin-w)',    ntst)

keymaps('','/','<Plug>(easymotion-sn)', ntst)
keymaps('o','/','<Plug>(easymotion-tn)', ntst)

-- quickhl
keymaps('n','<space>m','<Plug>(quickhl-manual-this)',  ntst)
keymaps('x','<space>m','<Plug>(quickhl-manual-this)',  ntst)
keymaps('n','<space>M','<Plug>(quickhl-manual-reset)', ntst)
keymaps('x','<space>M','<Plug>(quickhl-manual-reset)', ntst)

-- Lspsaga
keymaps('n','gh',':Lspsaga lsp_finder<CR>', ntst)

-- Command of mine

-- colo
vim.cmd [[colorscheme tokyonight]]
