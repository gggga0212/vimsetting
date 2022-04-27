vim.cmd ([[packadd packer.nvim]])
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim'}
end)
