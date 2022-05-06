--lspconfig
require'lspconfig'.pyright.setup{}

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
else
    vim.cmd ([[packadd packer.nvim]])
end
require 'lsp/init'
require 'lsp/setup'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    -- lspconfig
    use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {'terrortylor/nvim-comment', require('nvim_comment').setup()}
    --  use {'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'}
    --  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim'}
    use({"nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
        config = function()
        require("telescope").load_extension("lazygit")
        end,})
    use { "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = { 
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim"}}
end)
