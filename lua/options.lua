local keymaps = vim.api.nvim_set_keymap
local ntst = {noremap=true, silent=true}
local ntsf = {noremap=true, silent=false}
-- local group = vim.api.nvim_create_augroup("CscopeBuild", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = { "*.c", "*.h" },
--   callback = function ()
--     vim.cmd("Cscope db build")
--   end,
--   group = group,
-- })
vim.opt.termguicolors = true

require "lsp.treesitter"
require "lsp.gitsigns"
require "lsp.telescope"
require "lsp.colorizer"
require "lsp.color-picker"
require "lsp.mason"
require "lsp.nvim-cmp"
require "lsp.stuff"
require "lsp.cscope"
require "lsp.nvim-tree"
require "lsp.hi-my-words"
-- require "lsp.indent_blankline"
require "lsp.calltree"
-- require "lsp.winbar"

-- :help option
vim.opt.encoding      = 'utf-8'
vim.opt.signcolumn    = 'yes' --yes or number
vim.opt.cursorline    = true
vim.opt.cursorcolumn  = true
vim.opt.nu            = true
vim.opt.hls           = true -- search and highlight word
vim.opt.smartindent   = true
vim.opt.binary        = true
-- vim.opt.autoindent    = true
vim.opt.expandtab     = true
vim.opt.ic            = false -- ignorecase
vim.opt.sm            = true -- showmatch
vim.opt.cin           = true
vim.opt.ru            = true
vim.opt.cp            = false
vim.opt.swapfile      = false
vim.opt.compatible    = false

vim.opt.shiftwidth = 4
vim.opt.tabstop    = 4
vim.opt.softtabstop= 0 
vim.opt.laststatus = 2
vim.opt.rnu = false --relativenumber 

vim.g.t_Co         = 256
vim.g.backspace    = 2

-- checkhealth
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.vem_tabline_show_number = 'index'
-- folder indent vim.opt.foldmethod = 'indent'
vim.opt.foldmethod = 'syntax'
vim.opt.foldenable = false
-- winbar
-- vim.opt.winbar = '%m%f'
vim.opt.winbar = "%{%v:lua.require'lsp.winbar'.eval()%}"
-- ctags
vim.g.tags = './tags'
-- ctrlp
vim.g.ctrlp_map = '<c-p>'
vim.g.ctrlp_cmd = 'CtrlP'
-- airline
vim.g.tmux_navigator_no_mappings = 1
-- lsp_lines.nvim v2
vim.diagnostic.config({ virtual_lines = false })
keymaps('n','/', 'ms/',ntst)
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

-- keymaps('n','cg','mZ* :Cscope find g <C-R>=expand("<cword>")<CR><CR><CR>:cclose<CR>',ntst)
-- keymaps('n','cm','mZ* :Cscope find s <C-R>=expand("<cword>")<CR><CR>:cclose<CR>:Telescope quickfix<CR>',ntst)
-- keymaps('n','cc','mZ* :Cscope find c <C-R>=expand("<cword>")<CR><CR>:cclose<CR>:Telescope quickfix<CR>',ntst)
-- keymaps('n','ct','mZ* :Cscope find t <C-R>=expand("<cword>")<CR><CR>:cclose<CR>:Telescope quickfix<CR>',ntst)
-- keymaps('n','ce','mZ* :Cscope find e <C-R>=expand("<cword>")<CR><CR>:cclose<CR>:Telescope quickfix<CR>',ntst)
-- keymaps('n','cf','mZ* :Cscope find f <C-R>=expand("<cfile>")<CR><CR>:cclose<CR>:Telescope quickfix<CR>',ntst)
-- keymaps('n','ci','mZ* :Cscope find i <C-R>=expand("<cfile>")<CR><CR>:cclose<CR>:Telescope quickfix<CR>',ntst)
-- keymaps('n','cd','mZ* :Cscope find d <C-R>=expand("<cword>")<CR><CR>:cclose<CR>:Telescope quickfix<CR>',ntst)

keymaps('n','cg','mZ* :Cscope find g <C-R>=expand("<cword>")<CR><CR><CR>:cclose<CR>',ntst)
keymaps('n','cm','mZ* :Cscope find s <C-R>=expand("<cword>")<CR><CR><CR>',ntst)
keymaps('n','cc','mZ* :Cscope find c <C-R>=expand("<cword>")<CR><CR><CR>',ntst)
keymaps('n','ct','mZ* :Cscope find t <C-R>=expand("<cword>")<CR><CR><CR>',ntst)
keymaps('n','ce','mZ* :Cscope find e <C-R>=expand("<cword>")<CR><CR><CR>',ntst)
keymaps('n','cf','mZ* :Cscope find f <C-R>=expand("<cfile>")<CR><CR><CR>',ntst)
keymaps('n','ci','mZ* :Cscope find i <C-R>=expand("<cfile>")<CR><CR><CR>',ntst)
keymaps('n','cd','mZ* :Cscope find d <C-R>=expand("<cword>")<CR><CR><CR>',ntst)


-- keymaps('n','cG',[[<cmd>lua require('cscope_maps').cscope_prompt('g',vim.fn.expand("<cword>"))<CR>]],ntst)
-- keymaps('n','cM',[[<cmd>lua require('cscope_maps').cscope_prompt('s',vim.fn.expand("<cword>"))<CR>]],ntst)
-- keymaps('n','cC',[[<cmd>lua require('cscope_maps').cscope_prompt('c',vim.fn.expand("<cword>"))<CR>]],ntst)
-- keymaps('n','cT',[[<cmd>lua require('cscope_maps').cscope_prompt('t',vim.fn.expand("<cword>"))<CR>]],ntst)
-- keymaps('n','cE',[[<cmd>lua require('cscope_maps').cscope_prompt('e',vim.fn.expand("<cword>"))<CR>]],ntst)
-- keymaps('n','cF',[[<cmd>lua require('cscope_maps').cscope_prompt('f',vim.fn.expand("<cword>"))<CR>]],ntst)
-- keymaps('n','cI',[[<cmd>lua require('cscope_maps').cscope_prompt('i',vim.fn.expand("<cword>"))<CR>]],ntst)
-- keymaps('n','cD',[[<cmd>lua require('cscope_maps').cscope_prompt('d',vim.fn.expand("<cword>"))<CR>]],ntst)

keymaps('n','cj',':<C-U><C-R>=printf("Cscope find ")<CR>',ntsf)
-- vim.opt.cscopequickfix = 's-,g-,c-,d-,i-,t-,e-,f-,a-'

keymaps('n','cx', ':copen 10<CR>',  ntst)
keymaps('n','cv',':cclose<CR> :Telescope quickfix<CR>', ntst)
keymaps('n','cV',':Telescope quickfixhistory<CR>',      ntst)
keymaps('n','vv', ':cclose<CR>', ntst)
-- keymaps('n','<space>eh', ':NERDTree<CR>',ntst)
-- keymaps('n','<space>eh', ':NERDTreeToggle<CR>', ntst)
keymaps('n','<space>ef',':AerialToggle!<CR>',ntst)
keymaps('n','<space>el',':TagbarToggle<CR>', ntst)

-- Move in vim
keymaps('n', '<C-H>','<C-W>h',ntst)
keymaps('n', '<C-J>','<C-W>j',ntst)
keymaps('n', '<C-K>','<C-W>k',ntst)
keymaps('n', '<C-L>','<C-W>l',ntst)

keymaps('n', '<C-PageUp>',':resize -2<CR>',             ntst)
keymaps('n', '<C-PageDown>',':resize +2<CR>',           ntst)
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
keymaps('n','<space>fk',':FloatermKill<CR>',            ntst)
keymaps('t','<space>fk','<C-\\><C-n>:FloatermKill<CR>', ntst)

-- vimagit
keymaps('n','gj',':Gitsigns preview_hunk<CR>', ntst)
keymaps('n','gn',':Gitsigns next_hunk<CR>',    ntst)
keymaps('n','gp',':Gitsigns prev_hunk<CR>',    ntst)
keymaps('n','gu',':Gitsigns reset_hunk<CR>',   ntst)
keymaps('n','<space>gb',':Git blame<CR>',            ntst)
keymaps('n','<space>gf',':DiffviewFileHistory %<CR>',ntst)
keymaps('n','<space>gh',':DiffviewFileHistory<CR>',  ntst)
keymaps('n','<space>gl',':LazyGit<CR>',              ntst)
keymaps('n','<space>go',':DiffviewOpen -uno<CR>',    ntst)
keymaps('n','<space>gp',':DiffviewOpen @^ -uno<CR>', ntst)
keymaps('n','<space>gs',':DiffviewOpen $Sam -uno<CR>', ntst)
keymaps('n','<space>gq',':DiffviewClose<CR>',        ntst)
keymaps('n','<space>gr',':DiffviewRefresh<CR>',      ntst)
keymaps('n','<space>gt',':Telescope git_status<CR>', ntst)
keymaps('n','<space>gm',':<C-U><C-R>=printf("Gitsigns ")<CR>', ntsf)

keymaps('n','<space>vs',':vs<CR>', ntst)
keymaps('n','<space>sp',':sp<CR>', ntst)
-- Telescope
keymaps('n','<space>ta',':Colortils css list<CR>', ntst)
keymaps('n','<space>tA',':IconPickerNormal<CR>', ntst)
keymaps('n','<space>tb',':Telescope file_browser<CR>',ntsf)
keymaps('n','<space>tB',':<C-U><C-R>=printf("hi Normal ctermfg=white ctermbg=16")<CR>',ntsf)
keymaps('n','<space>tc',':Telescope colorscheme<CR>', ntst)
-- keymaps("n",'<space>tC',':PickColor<CR>', ntst)
-- keymaps("i",'<space>tC',':PickColorInsert<CR>', ntst)
keymaps('n','<space>td',':normal! J<CR>', ntst)
keymaps('n','<space>tf',':Telescope file_browser path=%:p:h select_buffer=true<CR>', ntst)
keymaps('n','<space>tg',':!go run main.go<CR>', ntst)
keymaps('n','<space>th',':NvimTreeToggle<CR>',  ntst)
keymaps('n','<space>ti','gg=G', ntst)
keymaps('n','<space>tj',':Telescope ', ntsf)
keymaps('n','<space>tk',':Telescope keymaps<CR>',  ntst)
keymaps('n','<space>tK',':!pkill -f tmux<CR>', ntst)
-- Move to line
keymaps('','<space>tl','<Plug>(easymotion-bd-jk)',         ntst)
keymaps('n','<space>tl','<Plug>(easymotion-overwin-line)', ntst)
-- highlight
keymaps('n','<space>tm',':!make all<CR>', ntst)
keymaps('n','<space>tn',':!make gdb<CR>', ntst)


keymaps('n','<space>to',':<C-U><C-R>=printf("!~/.config/tceetree/tceetree -V -p ")<CR>',ntsf)
keymaps('n','<space>tO',':<C-U><C-R>=printf("!dot -Tpdf -O tceetree.out")<CR><CR>:!cmd.exe /C start tceetree.out.pdf<CR>',ntsf)
keymaps('n','<space>tp',':!python sha.py<CR>', ntst)
keymaps('n','<space>tq',':LspStop<CR>', ntst)
keymaps('n','<space>tQ',':LspRestart<CR>', ntst)
-- keymaps('n','<space>te',':LspRestart<CR>', ntst)
keymaps('n','<space>tr',':Telescope live_grep<CR>',   ntst)
keymaps('n','<space>ts',':<C-U><C-R>=printf("%%s/%s/%s/g",expand("<cword>"),expand("<cword>"))<CR>',ntsf)
keymaps('n','<space>tt',':Telescope treesitter<CR>',  ntst)
keymaps('n','<space>tu',':Lazy sync<CR>', ntsf)
-- keymaps('n','<space>tV',':set ff=unix<CR>',  ntst)
-- Move to word
keymaps('','<space>tw','<Plug>(easymotion-bd-w)',          ntst)
keymaps('n','<space>tw','<Plug>(easymotion-overwin-w)',    ntst)
keymaps('n','<space>tx',':!mscgen -T png test.mscgen<CR>',ntst)
-- keymaps('n','<space>tX',':!cmd.exe /C start test.png<CR>',ntst)
keymaps('n','<space>ty',':!sh pj.sh<CR>',ntst)
keymaps('n','<space>tz',':TSToggle highlight<CR>',ntst)


keymaps('n','<space>ha',':Telescope marks<CR>',ntst)
keymaps('n','<space>hb',':e ~/.config/nvim/lua/options.lua<CR>',ntsf)
keymaps('n','<space>hB',':e ~/.config/nvim/lua/plugins.lua<CR>',ntsf)
keymaps('n','<space>hc',':Calc<CR>',ntsf)

keymaps('n','<space>hd',':<C-U><C-R>=printf("ConvDec 0x")<CR>',ntsf)
keymaps('n','<space>dh',':<C-U><C-R>=printf("ConvHex ")<CR>',ntsf)

keymaps('n','<space>hf',':lua require("harpoon.mark").add_file()<CR>',  ntst)
keymaps('n','<space>hn',':lua require("harpoon.ui").nav_next()<CR>',  ntst)
keymaps('n','<space>hp',':lua require("harpoon.ui").add_prev()<CR>',  ntst)
keymaps('n','<space>hv',':lua require("harpoon.ui").toggle_quick_menu()<CR>',  ntst)

-- keymaps('n','<space>ma',':lua require("telescope.builtin").marks()<CR>', ntst)

-- Easy motion

-- cursor
-- keymaps('n','<Leader>cl',':set cursorline! cursorcolumn!<CR>',  ntst)
-- vem-tabline
keymaps('n','<leader>p','<Plug>vem_move_buffer_left-',ntst)
keymaps('n','<leader>n','<Plug>vem_move_buffer_right-',ntst)
keymaps('n','<leader>h','<Plug>vem_prev_buffer-',ntst)
keymaps('n','<leader>l','<Plug>vem_next_buffer-',ntst)
keymaps('n','<leader>x','<Plug>vem_delete_buffer-',ntst)
keymaps('n','<leader>1',':VemTablineGo 1<CR>',ntst)
keymaps('n','<leader>2',':VemTablineGo 2<CR>',ntst)
keymaps('n','<leader>3',':VemTablineGo 3<CR>',ntst)
keymaps('n','<leader>4',':VemTablineGo 4<CR>',ntst)
keymaps('n','<leader>5',':VemTablineGo 5<CR>',ntst)
keymaps('n','<leader>6',':VemTablineGo 6<CR>',ntst)
keymaps('n','<leader>7',':VemTablineGo 7<CR>',ntst)
keymaps('n','<leader>8',':VemTablineGo 8<CR>',ntst)
keymaps('n','<leader>9',':VemTablineGo 9<CR>',ntst)
keymaps('n','<leader>a',':A<CR>',ntst)
keymaps('n','<leader>b','~',ntst)
keymaps('n','<leader>ce',':let g:com1=',ntsf)
keymaps('n','<leader>d','2<C-W>l:%s/\\r//g<CR>:w<CR>2<C-W>h',  ntst)
keymaps('n','<leader>D',':%s/\\r//g<CR>:w<CR>',  ntst)
keymaps('n','<leader>e',':e!<CR>',ntst)
keymaps('n','<leader>g','<C-]>',ntst)
keymaps('n','<leader>j','mN *',ntst)
keymaps('n','<leader>k','mN #',ntst)

keymaps('n','<leader>m',[[<cmd>HiMyWordsToggle<CR>]],ntst)
keymaps('n','<leader>M',[[<cmd>HiMyWordsClear<CR>]],ntst)

keymaps('n','<leader>q',':q!<CR>',ntst)

keymaps('n','<leader>rr',':CallerTreeCscope<CR><CR>',ntst) --cscope
keymaps('n','<leader>rf',':CalleeTreeCscope<CR><CR>',ntst) --cscope
keymaps('n','<leader>rR',':CallerTreeLsp<CR><CR>',ntst) --lsp
keymaps('n','<leader>rF',':CalleeTreeLsp<CR><CR>',ntst) --lsp
keymaps('n','<leader>rq',':CallTreeCloseAll<CR><CR>',ntst)

-- keymaps('n','<leader>f',':CCTreeTraceForward<CR><CR>', ntst)
-- keymaps('n','<leader>rc',':CCTreeTraceReverse<CR><CR>',ntst)
-- keymaps('n','<leader>rl',':CCTreeLoadDB<CR><CR>', ntst)

keymaps('n','<leader>t',':q<CR>:vs<CR>', ntst)
keymaps('n','<leader>T','<C-W>=', ntst)
keymaps('n','<leader>w',':w!<CR>',ntst)
keymaps('n','<leader>W',':%s/\t/    /g<CR>',ntst)

keymaps('n','<leader>sr',':set rnu!<CR>',   ntst)
keymaps('n','<leader>so',':so $MYVIMRC<CR>',   ntst)
keymaps('n','<leader>st',':Telescope live_grep<CR>',   ntst)
keymaps('n','<leader>sT',':Telescope live_grep_args<CR>',   ntst)
keymaps('n','<leader>sd',':Telescope diagnostics<CR>', ntst)
keymaps('n','<leader>sf',':Telescope find_files<CR>', ntst)
keymaps('n','<leader>sF',':Telescope dir find_files<CR>', ntst)
keymaps('n','<leader>sh',':Telescope help_tags<CR>',    ntst)
keymaps('n','<leader>ss',':Telescope grep_string<CR>',    ntst)
keymaps('n','<leader>sa',':Telescope aerial<CR>',    ntst)

-- paste
keymaps('x','p','pgvy',ntsf)

keymaps('v','cc','"*y :let @+=@*<CR>',ntsf)
keymaps('n','<leader>v','"+p',ntsf)
keymaps('v','<leader>v','"+p',ntsf)

vim.g.EasyMotion_do_mapping = 0
keymaps('n','s','<Plug>(easymotion-overwin-f2)',           ntst)
keymaps('','/','<Plug>(easymotion-sn)', ntst)
keymaps('o','/','<Plug>(easymotion-tn)', ntst)
-- Lspsaga
-- keymaps('n','gh',':Lspsaga lsp_finder<CR>', ntst)
keymaps('n','J','j', ntst)
keymaps('n','V','0v$', ntst)
keymaps('n','[[','[[k', ntst)
keymaps('i','kk','<ESC>', ntst)
keymaps('i','jj','<ESC>', ntst)
keymaps('n','<C-H>',':TmuxNavigateLeft<CR>', ntst)
keymaps('n','<C-K>',':TmuxNavigateUp<CR>', ntst)
keymaps('n','<C-L>',':TmuxNavigateRight<CR>', ntst)
keymaps('n','<C-J>',':TmuxNavigateDown<CR>', ntst)
vim.cmd [[colorscheme tokyonight]]
