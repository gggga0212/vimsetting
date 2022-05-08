local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require 'init'

return require('packer').startup(function(use)
  -- My plugins here
  -- Automatically set up your configuration after cloning packer.nvim
    use {'wbthomason/packer.nvim'}
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    -- lspconfig
    use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
    use({"nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
        config = function()
        require("telescope").load_extension("lazygit")
        end,})
    use {'lewis6991/gitsigns.nvim'}

    -- use {'lewis6991/gitsigns.nvim',
    --     config = function()
    --     require('lsp/gitsigns').setup()
    --     end}

    use { "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = { 
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim"}}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'terrortylor/nvim-comment', require('nvim_comment').setup()}
 -- todo
     use {'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'}
  if packer_bootstrap then
    require('packer').sync()
  end
end)
