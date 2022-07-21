local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    print("Installing Telescope and dependencies.")
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end



return require('packer').startup(function(use)
  -- My plugins here
  -- Automatically set up your configuration after cloning packer.nvim
    use {'wbthomason/packer.nvim'}
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    -- lspconfig
    use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
    use({"nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "kdheepak/lazygit.nvim" },
            { "nvim-telescope/telescope-live-grep-args.nvim" },
        },
        config = function()
        require("telescope").load_extension("lazygit")
        require("telescope").load_extension("live_grep_args")
        end,})
    use {'lewis6991/gitsigns.nvim'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'terrortylor/nvim-comment', require('nvim_comment').setup()}
    use {'preservim/nerdtree'}
    use {'Xuyuanp/nerdtree-git-plugin'}
    use {'luochen1990/rainbow'}
    use {'tpope/vim-fugitive'}
    use {'tpope/vim-rhubarb'}
    use {'bootleq/vim-gitdiffall'}
    use {'christoomey/vim-tmux-navigator'}
    use {'voldikss/vim-floaterm'}
    use {'junegunn/vim-easy-align'}
    use {'t9md/vim-quickhl'}
    use {'vim-scripts/a.vim'}
    use {'junegunn/fzf'}
    use {'junegunn/fzf.vim'}
    use {'wesleyche/Trinity'}
    use {'vim-syntastic/syntastic'}
    use {'preservim/tagbar'}
    use {'terryma/vim-multiple-cursors'}
    use {'https://github.com/nanotech/jellybeans.vim'}
    use {'https://github.com/tomasr/molokai'}
    use {'shaunsingh/solarized.nvim'}
    use {'ghifarit53/tokyonight-vim'}
    use {'rebelot/kanagawa.nvim'}
    -- use {'folke/tokyonight.nvim'}
    use {'catppuccin/nvim',as = "catppuccin"}
    use {'hzchirs/vim-material'}
    use {'kshenoy/vim-signature'}
    use {'jlanzarotta/bufexplorer'}
    use {'BurntSushi/ripgrep'}
    -- use {'SirVer/ultisnips'}
    use {'honza/vim-snippets'}
    use {'sickill/vim-monokai'}
    use {'morhetz/gruvbox'}
    use {'vim-airline/vim-airline'}
    use {'vim-airline/vim-airline-themes'}
    use {'kien/ctrlp.vim'}
    use {'easymotion/vim-easymotion'}
    use {'tpope/vim-surround'}
    use {'kevinhwang91/nvim-bqf', ft = 'qf'}
    -- use {'kevinhwang91/nvim-bqf'}
    use {'fgheng/winbar.nvim'}
    use {'norcalli/nvim-colorizer.lua'}
    use {'ziontee113/color-picker.nvim',
        config = function()
            require("color-picker")
        end,}
    use {'max397574/colortils.nvim',
        cmd = "Colortils",
        config = function()
            require("colortils").setup()
        end,
    }
    -- use {'kyazdani42/nvim-web-devicons'}
    use {'Yggdroot/indentLine'}
    use {'ryanoasis/vim-devicons'}
 -- todo
    use {'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'}
    -- use {'glepnir/lspsaga.nvim'}
    use { 'hrsh7th/nvim-cmp'}
    use { 'hrsh7th/cmp-nvim-lsp'}
    use { 'hrsh7th/cmp-buffer'}
    use { 'hrsh7th/cmp-path'}
    use { 'hrsh7th/cmp-cmdline'}
    use {'MattesGroeger/vim-bookmarks'}

  if packer_bootstrap then
    require('packer').sync()
  end
end)
