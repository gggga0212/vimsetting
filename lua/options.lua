local keymaps = vim.api.nvim_set_keymap
local opts = {noremap=true, silent=true}
-- :help option
vim.opt.nu          = true
vim.opt.hls         = true
vim.opt.smartindent = true
vim.opt.expandtab   = true
vim.opt.cursorline  = true
vim.opt.cursorcolumn =true
vim.opt.cscopetag   = true
vim.opt.tabstop     = 4
vim.opt.shiftwidth  = 4
vim.opt.csto        = 0
vim.opt.laststatus  = 2

-- checkhealth
vim.g["loaded_ruby_provider"] = 0
vim.g["loaded_node_provider"] = 0
vim.g["loaded_perl_provider"] = 0

-- colo
vim.g["tokyonight_style"]         = "night" -- available: night, storm
vim.g["tokyonight_enable_italic"] = 1



keymaps('n', '<F2>',':tabe ~/.config/nvim/init.vim<CR>',        { noremap=true, silent=true})
keymaps('n', '<F3>',':tabe ~/.config/nvim/lua/plugins.lua<CR>', { noremap=true, silent=true})
keymaps('n', '<F4>',':RainbowToggle<CR>',                       { noremap=true, silent=true})
keymaps('n', '<F5>',':TSToggle highlight<CR>',                  { noremap=true, silent=true})

-- keymaps('n', '<F6>',':!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
--             \:!cscope -R -b -q -i cscope.files -f cscope.out<CR>
--             \:cs reset<CR>',{ noremap=true, silent=true})

-- Move in vim
keymaps('n', '<C-H>','<C-W>h',{noremap=true, silent=true})
keymaps('n', '<C-J>','<C-W>j',{noremap=true, silent=true})
keymaps('n', '<C-K>','<C-W>k',{noremap=true, silent=true})
keymaps('n', '<C-L>','<C-W>l',{noremap=true, silent=true})

keymaps('n', '<C-Up>',':resize -2<CR>',            {noremap=true, silent=true})
keymaps('n', '<C-Down>','resize +2<CR>',           {noremap=true, silent=true})
keymaps('n', '<C-Left>',':vertical resize -2<CR>', {noremap=true, silent=true})
keymaps('n', '<C-Right>','vertical resize +2<CR>', {noremap=true, silent=true})

-- Stay in indent mode
keymaps('v', ">",">gv",{noremap=true, silent=true})
keymaps('v', "<","<gv",{noremap=true, silent=true})

-- Move text up and down
keymaps('v', '<A-j>',':m.+1<CR>==',{noremap=true, silent=true})
keymaps('v', '<A-k>',':m.-2<CR>==',{noremap=true, silent=true})
-- Visual Block
-- Move text up and down
keymaps('x', 'J',":move '>+1<CR>gv-gv",     {noremap=true, silent=true})
keymaps('x', 'K',":move '<-1<CR>gv-gv",     {noremap=true, silent=true})
keymaps('x', '<A-j>',":move '>+1<CR>gv-gv", {noremap=true, silent=true})
keymaps('x', '<A-k>',":move '<-2<CR>gv-gv", {noremap=true, silent=true})

-- cscope
-- s: Find this C symbol.
-- g: Find this definition.
-- c: Find functions calling this function.
-- t: Find this file.
-- e: Find this grep pattern.
-- f: Find this file.
-- i: Find files #including this file.
-- d: Find functions called by this function.
keymaps('n','cs',':cs find s <C-R>=expand("<cword>")<CR><CR>',{noremap=true, silent=true})
keymaps('n','cg',':cs find g <C-R>=expand("<cword>")<CR><CR>',{noremap=true, silent=true})
keymaps('n','cc',':cs find c <C-R>=expand("<cword>")<CR><CR>',{noremap=true, silent=true})
keymaps('n','ct',':cs find t <C-R>=expand("<cword>")<CR><CR>',{noremap=true, silent=true})
keymaps('n','ce',':cs find e <C-R>=expand("<cword>")<CR><CR>',{noremap=true, silent=true})
keymaps('n','cf',':cs find f <C-R>=expand("<cword>")<CR><CR>',{noremap=true, silent=true})
keymaps('n','ci',':cs find i <C-R>=expand("<cword>")<CR><CR>',{noremap=true, silent=true})
keymaps('n','cd',':cs find d <C-R>=expand("<cword>")<CR><CR>',{noremap=true, silent=true})

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
keymaps('n','<space>ga',':Gw<CR>',                    {noremap=true, silent=true})
keymaps('n','<space>gl',':LazyGit<CR>',               {noremap=true, silent=true})
keymaps('n','<space>go',':DiffviewOpen -uno<CR>',     {noremap=true, silent=true})
keymaps('n','<space>gr',':DiffviewRefresh<CR>',       {noremap=true, silent=true})

-- Telescope
keymaps('n','<space>tf',':Telescope find_files<CR>',  {noremap=true, silent=true})
keymaps('n','<space>tg',':Telescope live_grep<CR>',   {noremap=true, silent=true})
keymaps('n','<space>tt',':Telescope treesitter<CR>',  {noremap=true, silent=true})
keymaps('n','<space>th',':Neotree',                   {noremap=true, silent=true})

-- quickhl
keymaps('n','<space>m','<Plug>(quickhl-manual-this)',  { noremap=true, silent=true})
keymaps('x','<space>m','<Plug>(quickhl-manual-this)',  { noremap=true, silent=true})
keymaps('n','<space>M','<Plug>(quickhl-manual-reset)', { noremap=true, silent=true})
keymaps('x','<space>M','<Plug>(quickhl-manual-reset)', { noremap=true, silent=true})
-- Command of mine

