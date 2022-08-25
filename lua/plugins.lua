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
    -- mason
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        -- "neovim/nvim-lspconfig",
        }
    -- lspconfig
    use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
    use({"nvim-telescope/telescope.nvim",
        requires = {
            -- { "nvim-lua/plenary.nvim" },
            { "kdheepak/lazygit.nvim" },
            { "nvim-telescope/telescope-live-grep-args.nvim" },
        },
        config = function()
        require("telescope").load_extension("lazygit")
        require("telescope").load_extension("live_grep_args")
        end,})
    use {'lewis6991/gitsigns.nvim'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'nvim-treesitter/nvim-treesitter-context'}
    use {'Djancyp/better-comments.nvim'}
    use {'terrortylor/nvim-comment', require('nvim_comment').setup()}
    use {'preservim/nerdtree'}
    use {'Xuyuanp/nerdtree-git-plugin'}
    use {'luochen1990/rainbow'}
    use {'p00f/nvim-ts-rainbow'}
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
    use {'hzchirs/vim-material'}
    use {'kshenoy/vim-signature'}
    use {'jlanzarotta/bufexplorer'}
    use {'BurntSushi/ripgrep'}
    -- use {'SirVer/ultisnips'}
    -- use {'honza/vim-snippets'}
    use {'sickill/vim-monokai'}
    use {'morhetz/gruvbox'}
    use {'vim-airline/vim-airline'}
    use {'vim-airline/vim-airline-themes'}
    use {'kien/ctrlp.vim'}
    use {'easymotion/vim-easymotion'}
    use({'kylechui/nvim-surround',
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            }) end })
    -- use {'kevinhwang91/nvim-bqf', ft = 'qf'}
    use {'hari-rangarajan/CCTree'}
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
    use {'mg979/vim-visual-multi'}
    use {'kyazdani42/nvim-web-devicons'}
    -- use {'lukas-reineke/indent-blankline.nvim',
    --     config = function()
    --     require (lsp.indent_blankline) end,}
    use {'Yggdroot/indentLine'}
    use {'ryanoasis/vim-devicons'}
    use {'pacha/vem-tabline'}
 -- todo
    use {'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'}
    use {'mhartington/formatter.nvim'}
    use {'ranjithshegde/ccls.nvim'}
    -- use {'glepnir/lspsaga.nvim'}
    use { 'hrsh7th/cmp-nvim-lsp'}
    use { 'hrsh7th/cmp-buffer'}
    use { 'hrsh7th/cmp-path'}
    use { 'hrsh7th/cmp-cmdline'}
    use {'MattesGroeger/vim-bookmarks'}
    use {'ThePrimeagen/harpoon'}
    use {'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
        config = function()
        require("lsp_lines").setup()
        end,}
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
    -- use { 'hrsh7th/nvim-cmp'}
    use {'hrsh7th/nvim-cmp'}
    use {'saadparwaiz1/cmp_luasnip'}
    use {'L3MON4D3/LuaSnip',
        after = 'nvim-cmp',
        config = function()
            require('lsp.luasnip') end,}
  if packer_bootstrap then
    require('packer').sync()
  end
end)
