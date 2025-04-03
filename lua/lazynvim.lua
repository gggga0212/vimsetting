local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- My plugins here
    -- Automatically set up your configuration after cloning packer.nvim
    -- {'wbthomason/packer.nvim'},
    {
      'stevearc/aerial.nvim',
      opts = {},
      -- Optional dependencies
      dependencies = {
         "nvim-treesitter/nvim-treesitter",
         "nvim-tree/nvim-web-devicons"
      },
    },
    {'nvim-lua/plenary.nvim'},
    { 'sindrets/diffview.nvim'},
    {'tamton-aquib/stuff.nvim'},
    -- tree
    {
      "daishengdong/calltree.nvim",
      dependencies = {
        "dhananjaylatkar/cscope_maps.nvim",
        "folke/which-key.nvim", -- optional [for whichkey hints]
      },
      opts = {
        -- USE EMPTY FOR DEFAULT OPTIONS
        -- DEFAULTS ARE LISTED BELOW
      },
    },
    -- mason
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    {'p00f/clangd_extensions.nvim'},
    {'jose-elias-alvarez/null-ls.nvim'},
    { "nvim-telescope/telescope-live-grep-args.nvim" },
    {"nvim-telescope/telescope.nvim",
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
        require("telescope").load_extension("lazygit")
        -- require("telescope").load_extension("live_grep_args")
    end,},
    { "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    { "princejoogie/dir-telescope.nvim",
      -- telescope.nvim is a required dependency
      config = function()
        require("dir-telescope").setup({
          hidden = true,
          respect_gitignore = true,
        })
      end,},
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim" },
    {'lewis6991/gitsigns.nvim'},
    {'nvim-treesitter/nvim-treesitter'},
    {'nvim-treesitter/nvim-treesitter-context'},
    {'nvim-treesitter/tree-sitter-query'},
    {'RRethy/nvim-treesitter-textsubjects'},
    {'HiPhish/rainbow-delimiters.nvim'},
    { 'numToStr/Comment.nvim',
        opts = {
        -- add any options here
        }
    },
    {"nvim-tree/nvim-tree.lua"},
    {"nvim-neo-tree/neo-tree.nvim", branch = "v3.x", },
    {'tpope/vim-fugitive'},
    {'tpope/vim-rhubarb'},
    -- {'bootleq/vim-gitdiffall'},
    {'christoomey/vim-tmux-navigator'},
    {'aserowy/tmux.nvim'},
    {'voldikss/vim-floaterm'},
    {'junegunn/vim-easy-align'},
    {'t9md/vim-quickhl'},
    {'vim-scripts/a.vim'},
    {'junegunn/fzf'},
    {'junegunn/fzf.vim'},
    {'wesleyche/Trinity'},
    {'vim-syntastic/syntastic'},
    {'preservim/tagbar'},
    {'jake-stewart/multicursor.nvim'},
    {'https://github.com/nanotech/jellybeans.vim'},
    {'https://github.com/tomasr/molokai'},
    {'shaunsingh/solarized.nvim'},
    {'ghifarit53/tokyonight-vim'},
    {'tiagovla/tokyodark.nvim'},
    {'judaew/ronny.nvim'},
    {'cryptomilk/nightcity.nvim'},
    {'rebelot/kanagawa.nvim'},
    -- {'folke/tokyonight.nvim'},
    { 'nyngwang/nvimgelion',
          config = function ()
            -- do whatever you want for further customization~
          end
    },
    -- {"ray-x/lsp_signature.nvim",
    --     event = "InsertEnter",
    --     opts = {
    --         bind = true,
    --         handler_opts = {
    --           border = "rounded"
    --         }
    --     },
    --     config = function(_, opts) require'lsp_signature'.setup(opts) end
    -- },

    {'hachy/eva01.vim'},
    {'hzchirs/vim-material'},
    {'kshenoy/vim-signature'},
    {'jlanzarotta/bufexplorer'},
    {'BurntSushi/ripgrep'},
    {'sickill/vim-monokai'},
    {'morhetz/gruvbox'},
    {'vim-airline/vim-airline'},
    {'vim-airline/vim-airline-themes'},
    {'kien/ctrlp.vim'},
    {'easymotion/vim-easymotion'},
    { "catppuccin/nvim", as = "catppuccin"},
    { "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end },
    {'hari-rangarajan/CCTree'},
    -- {'fgheng/winbar.nvim'},
    {'norcalli/nvim-colorizer.lua'},
    {'ziontee113/color-picker.nvim',
    config = function()
        require("color-picker")
    end,},
    {'max397574/colortils.nvim',
    cmd = "Colortils",
    config = function()
        require("colortils").setup()
    end,},
    -- {"stevearc/dressing.nvim"},
    {"ziontee113/icon-picker.nvim",
      config = function()
        require("icon-picker").setup({
          disable_legacy_commands = true
        })
      end,
    },
    {'echasnovski/mini.nvim', version = '*'},
    {'mg979/vim-visual-multi'},
    {'kyazdani42/nvim-web-devicons'},

    -- {'Yggdroot/indentLine'},
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },
    {'ryanoasis/vim-devicons'},
    {'pacha/vem-tabline'},
    -- todo
    {'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'},
    {'mhartington/formatter.nvim'},
    {'ranjithshegde/ccls.nvim'},
    {'simonefranza/nvim-conv'},
    -- {'glepnir/lspsaga.nvim'},
    { 'hrsh7th/cmp-nvim-lsp'},
    { 'hrsh7th/cmp-buffer'},
    { 'hrsh7th/cmp-path'},
    { 'hrsh7th/cmp-cmdline'},
    {'MattesGroeger/vim-bookmarks'},
    {'ThePrimeagen/harpoon'},
    {
      'gorbit99/codewindow.nvim',
      config = function()
        local codewindow = require('codewindow')
        codewindow.setup()
        codewindow.apply_default_keybinds()
      end,
    },
     -- Lua
    {
      "folke/which-key.nvim",
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to the default settings
          -- refer to the configuration section below
        }
      end
    },
    -- cscope
    { "dhananjaylatkar/cscope_maps.nvim",
      dependencies = {
        "folke/which-key.nvim", -- optional [for whichkey hints]
      },
      opts = {
        -- USE EMPTY FOR DEFAULT OPTIONS
        -- DEFAULTS ARE LISTED BELOW
        } },
    -- { "ludovicchabant/vim-gutentags",
    --     after = "cscope_maps.nvim",
    --     config = function()
    --     vim.g.gutentags_modules = {"cscope_maps"} -- This is required. Other config is optional
    --     vim.g.gutentags_cscope_build_inverted_index_maps = 1
    --     vim.g.gutentags_cache_dir = vim.fn.expand("~/code/.gutentags")
    --     vim.g.gutentags_file_list_command = "fd -e c -e h"
    --     -- vim.g.gutentags_trace = 1
    -- end, },
    -- {'mfussenegger/nvim-dap'},

    -- { 'mcauley-penney/visual-whitespace.nvim',
    --    config = true
    -- },

    {'ibhagwan/fzf-lua'}, -- required for picker = "fzf-lua"
    {'nvim-tree/nvim-web-devicons'}, -- optional [for devicons in telesc ope or fzf]
    {'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
     config = function()
         require("lsp_lines").setup()
     end,},
    {'dvoytik/hi-my-words.nvim'},
    {'kevinhwang91/promise-async'},
    {'kevinhwang91/nvim-ufo'},
     -- { 'hrsh7th/nvim-cmp'},
     --🦆 ඞ 🦀 🐈 🐎 🦖 🐤 
     { 'tamton-aquib/duck.nvim',
     config = function()
         vim.keymap.set('n', '<leader>dd', function() require("duck").hatch("🦆", 10) end, {})
         vim.keymap.set('n', '<leader>dk', function() require("duck").cook("🦆") end, {})
     end
 },
    {'hrsh7th/nvim-cmp'},
    {'saadparwaiz1/cmp_luasnip'},
    {'L3MON4D3/LuaSnip',
    after = 'nvim-cmp',
    config = function()
        require('lsp.luasnip') end,}
})
