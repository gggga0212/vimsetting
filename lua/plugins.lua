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
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim'}
    -- lspconfig
    use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)
