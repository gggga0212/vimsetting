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
    use {'tamton-aquib/stuff.nvim'}
    -- mason
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    -- use {'aduros/ai.vim'}
    -- lspconfig
    -- use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
    use {'p00f/clangd_extensions.nvim'}
    use {'jose-elias-alvarez/null-ls.nvim'}
    use {"nvim-telescope/telescope.nvim",
    requires = {
        -- { "nvim-lua/plenary.nvim" },
        { "kdheepak/lazygit.nvim" },
        { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    config = function()
        require("telescope").load_extension("lazygit")
        require("telescope").load_extension("live_grep_args")
    end,}
    use {
      "princejoogie/dir-telescope.nvim",
      -- telescope.nvim is a required dependency
      requires = {"nvim-telescope/telescope.nvim"},
      config = function()
        require("dir-telescope").setup({
          hidden = true,
          respect_gitignore = true,
        })
      end,}
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use {'lewis6991/gitsigns.nvim'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'nvim-treesitter/nvim-treesitter-context'}
    use {'Djancyp/better-comments.nvim'}
    use {'terrortylor/nvim-comment', require('nvim_comment').setup()}
    use {'preservim/nerdtree'}
    use {'Xuyuanp/nerdtree-git-plugin'}
    use {'luochen1990/rainbow'}
    -- use {'p00f/nvim-ts-rainbow'}
    use {'HiPhish/nvim-ts-rainbow2'}
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
    use {'tiagovla/tokyodark.nvim'}
    use {'rebelot/kanagawa.nvim'}
    use {'folke/tokyonight.nvim'}
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
    use { "catppuccin/nvim", as = "catppuccin" }
    use({'kylechui/nvim-surround',
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
            require("nvim-surround").setup({
                    -- Configuration here, or leave empty to use defaults
                }) end })
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
     end,}
     use "stevearc/dressing.nvim"
     use({"ziontee113/icon-picker.nvim",
       config = function()
         require("icon-picker").setup({
           disable_legacy_commands = true
         })
       end,
     })
     use {'echasnovski/mini.nvim'}
     use {'mg979/vim-visual-multi'}
     use {'kyazdani42/nvim-web-devicons'}

     use {'Yggdroot/indentLine'}
     use {'ryanoasis/vim-devicons'}
     use {'pacha/vem-tabline'}
     -- todo
     use {'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'}
     use {'mhartington/formatter.nvim'}
     use {'ranjithshegde/ccls.nvim'}
     use {'simonefranza/nvim-conv'}
     -- use {'glepnir/lspsaga.nvim'}
     use { 'hrsh7th/cmp-nvim-lsp'}
     use { 'hrsh7th/cmp-buffer'}
     use { 'hrsh7th/cmp-path'}
     use { 'hrsh7th/cmp-cmdline'}
     use {'MattesGroeger/vim-bookmarks'}
     use {'ThePrimeagen/harpoon'}
     use {
       'gorbit99/codewindow.nvim',
       config = function()
         local codewindow = require('codewindow')
         codewindow.setup()
         codewindow.apply_default_keybinds()
       end,
     }
     -- Lua
    use {
      "folke/which-key.nvim",
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
    -- cscope
    use {'dhananjaylatkar/cscope_maps.nvim'} -- cscope keymaps
    use {'ibhagwan/fzf-lua'} -- required for picker = "fzf-lua"
    -- load cscope maps
    -- pass empty table to setup({}) for default options
    require('cscope_maps').setup({
      disable_maps = false, -- true disables my keymaps, only :Cscope will be loaded
      cscope = {
        db_file = "./cscope.out", -- location of cscope db file
        exec = "cscope", -- "cscope" or "gtags-cscope"
        picker = "quickfix", -- "telescope", "fzf-lua" or "quickfix"
        skip_picker_for_single_result = true, -- jump directly to position for single result
        db_build_cmd_args = { "-bqkv" }, -- args used for db build (:Cscope build)
      },
    })
     -- use {'ldelossa/nvim-ide'}
     use {'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
     config = function()
         require("lsp_lines").setup()
     end,}
     use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
     -- use { 'hrsh7th/nvim-cmp'}
     --🦆 ඞ 🦀 🐈 🐎 🦖 🐤 
     use { 'tamton-aquib/duck.nvim',
     config = function()
         vim.keymap.set('n', '<leader>dd', function() require("duck").hatch("🦆", 10) end, {})
         vim.keymap.set('n', '<leader>dk', function() require("duck").cook("🦆") end, {})
     end
 }
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
