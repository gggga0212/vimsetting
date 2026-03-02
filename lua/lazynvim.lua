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

    -- ─── Core Dependencies ────────────────────────────────────────────
    {'nvim-lua/plenary.nvim'},
    {'nvim-tree/nvim-web-devicons'},
    {'ryanoasis/vim-devicons'},
    {'kevinhwang91/promise-async'},
    {"folke/snacks.nvim"},
    {
      "folke/which-key.nvim",
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup {}
      end
    },

    -- ─── LSP & Language Tools ─────────────────────────────────────────
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    {'p00f/clangd_extensions.nvim'},
    {'jose-elias-alvarez/null-ls.nvim'},
    {'ranjithshegde/ccls.nvim'},
    {'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
      config = function()
          require("lsp_lines").setup()
      end,
    },

    -- ─── Completion ───────────────────────────────────────────────────
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {'saadparwaiz1/cmp_luasnip'},
    {'L3MON4D3/LuaSnip',
      after = 'nvim-cmp',
      config = function()
          require('lsp.luasnip')
      end,
    },

    -- ─── Treesitter ───────────────────────────────────────────────────
    {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
    {'nvim-treesitter/nvim-treesitter-context'},
    {'nvim-treesitter/tree-sitter-query'},
    {'RRethy/nvim-treesitter-textsubjects'},
    {'HiPhish/rainbow-delimiters.nvim'},

    -- ─── Navigation & Search ──────────────────────────────────────────
    {"nvim-telescope/telescope.nvim",
      dependencies = {'nvim-lua/plenary.nvim'},
      config = function()
          require("telescope").load_extension("lazygit")
          -- require("telescope").load_extension("live_grep_args")
      end,
    },
    {"nvim-telescope/telescope-live-grep-args.nvim"},
    {"nvim-telescope/telescope-file-browser.nvim"},
    {"nvim-telescope/telescope-fzf-native.nvim"},
    {"princejoogie/dir-telescope.nvim",
      config = function()
        require("dir-telescope").setup({
          hidden = true,
          respect_gitignore = true,
        })
      end,
    },
    {'junegunn/fzf'},
    {'junegunn/fzf.vim'},
    {'ibhagwan/fzf-lua'},
    {
      'stevearc/aerial.nvim',
      opts = {},
      dependencies = {
         "nvim-treesitter/nvim-treesitter",
         "nvim-tree/nvim-web-devicons"
      },
    },
    {
      "daishengdong/calltree.nvim",
      dependencies = {
        "dhananjaylatkar/cscope_maps.nvim",
        "folke/which-key.nvim",
      },
      opts = {},
    },
    {"dhananjaylatkar/cscope_maps.nvim",
      dependencies = {
        "folke/which-key.nvim",
      },
      opts = {},
    },
    {'ThePrimeagen/harpoon'},
    {'kevinhwang91/nvim-ufo'},
    {'easymotion/vim-easymotion'},
    {'ctrlpvim/ctrlp.vim'},

    -- ─── Git ──────────────────────────────────────────────────────────
    {'lewis6991/gitsigns.nvim'},
    {'tpope/vim-fugitive'},
    {'tpope/vim-rhubarb'},
    {"kdheepak/lazygit.nvim",
      dependencies = {"nvim-lua/plenary.nvim"},
    },
    {'sindrets/diffview.nvim'},

    -- ─── File Tree ────────────────────────────────────────────────────
    {"nvim-tree/nvim-tree.lua"},
    {"nvim-neo-tree/neo-tree.nvim", branch = "v3.x"},

    -- ─── Terminal & Tmux ──────────────────────────────────────────────
    {'voldikss/vim-floaterm'},
    {'christoomey/vim-tmux-navigator'},
    {'aserowy/tmux.nvim'},

    -- ─── Editor Features ──────────────────────────────────────────────
    {'numToStr/Comment.nvim', opts = {}},
    {"kylechui/nvim-surround",
      version = "*",
      event = "VeryLazy",
      config = function()
          require("nvim-surround").setup({})
      end,
    },
    {'junegunn/vim-easy-align'},
    {'jake-stewart/multicursor.nvim'},
    {'mg979/vim-visual-multi'},
    {'echasnovski/mini.nvim', version = '*'},
    {'t9md/vim-quickhl'},
    {'kshenoy/vim-signature'},

    -- ─── Code Analysis ────────────────────────────────────────────────
    {'preservim/tagbar'},
    {'hari-rangarajan/CCTree'},
    {'wesleyche/Trinity'},
    {'vim-syntastic/syntastic'},
    {
      'gorbit99/codewindow.nvim',
      config = function()
        local codewindow = require('codewindow')
        codewindow.setup()
        codewindow.apply_default_keybinds()
      end,
    },

    -- ─── Formatting & Code Actions ────────────────────────────────────
    {'mhartington/formatter.nvim'},
    {'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'},

    -- ─── UI & Appearance ──────────────────────────────────────────────
    {'vim-airline/vim-airline'},
    {'vim-airline/vim-airline-themes'},
    {'pacha/vem-tabline'},
    {'norcalli/nvim-colorizer.lua'},
    {'dvoytik/hi-my-words.nvim'},

    -- ─── Colorschemes ─────────────────────────────────────────────────
    {'https://github.com/nanotech/jellybeans.vim'},
    {'https://github.com/tomasr/molokai'},
    {'shaunsingh/solarized.nvim'},
    {'ghifarit53/tokyonight-vim'},
    {'tiagovla/tokyodark.nvim'},
    {'judaew/ronny.nvim'},
    {'cryptomilk/nightcity.nvim'},
    {'rebelot/kanagawa.nvim'},
    {'nyngwang/nvimgelion', config = function() end},
    {'hachy/eva01.vim'},
    {'hzchirs/vim-material'},
    {'sickill/vim-monokai'},
    {'morhetz/gruvbox'},
    {"catppuccin/nvim", name = "catppuccin"},

    -- ─── Utilities ────────────────────────────────────────────────────
    {'tamton-aquib/stuff.nvim'},
    {'vim-scripts/a.vim'},
    {'BurntSushi/ripgrep'},
    {'jlanzarotta/bufexplorer'},
    {'MattesGroeger/vim-bookmarks'},
    {'simonefranza/nvim-conv'},
    {'ziontee113/color-picker.nvim',
      config = function()
          require("color-picker")
      end,
    },
    {'max397574/colortils.nvim',
      cmd = "Colortils",
      config = function()
          require("colortils").setup()
      end,
    },
    {"ziontee113/icon-picker.nvim",
      config = function()
        require("icon-picker").setup({ disable_legacy_commands = true })
      end,
    },
    {'tamton-aquib/duck.nvim',
      config = function()
          vim.keymap.set('n', '<leader>dd', function() require("duck").hatch("🦆", 10) end, {})
          vim.keymap.set('n', '<leader>dk', function() require("duck").cook("🦆") end, {})
      end,
    },

    -- ─── AI ───────────────────────────────────────────────────────────
    {
      "coder/claudecode.nvim",
      dependencies = { "folke/snacks.nvim" },
      config = true,
      keys = {
        { "<leader>ak", nil, desc = "AI/Claude Code" },
        { "<leader>at", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
        { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
        { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
        { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
        { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
        { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
        { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
        {
          "<leader>as",
          "<cmd>ClaudeCodeTreeAdd<cr>",
          desc = "Add file",
          ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
        },
        { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
        { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
      },
    },
})
