
local actions = require("telescope.actions")
-- local lga_actions = require("telescope-live-grep-args.actions")
local sorters = require('telescope.sorters')
local previewers = require('telescope.previewers')
require('telescope').setup({
    defaults = {
        -- layout_config = {
        --     -- vertical = { width = 0.9 }
        --     width = 0.95,
        --     -- other layout configuration here
        --     horizontal = {
        --         prompt_position = "bottom",
        --     },
        -- },
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
            n ={
                ["q"] = actions.close,
                ["<esc>"] = actions.close,
            }
        },
        vimgrep_arguments = {
           "rg",
           "--color=never",
           "--no-heading",
           "--with-filename",
           "--line-number",
           "--column",
           "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
           horizontal = {
              prompt_position = "bottom", --bottom,top
              preview_width = 0.45,
              results_width = 0.9,
           },
           vertical = {
              mirror = true,
           },
           width = 0.95,
           -- height = 0.80,
           -- preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = {
            "./firmware/src/config/default/ble/lib/include",
            "./firmware/src/config/default/ble/middleware_ble",
            "./firmware/src/config/default/ble/profile_ble",
            "./firmware/src/config/default/ble/service_ble"},
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "tail" }, -- tail,absolute
        -- path_display = { truncate = 2 }, -- tail,absolute
        -- layout_strategy = "vertical",
        -- layout_config = {mirror = true},
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    },
    live_grep = {
        only_sort_text = true
    },
    extensions = {
        live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            mappings = {
                -- i = {
                --     ["<C-u>"] = lga_actions.quote_prompt(),
                --     ["<C-i>"] = lga_actions.quote_prompt({postfix = "--iglob"}),
                -- }
            }
        },
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",  -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"}
            }
    },
    pickers = {
        colorscheme = {
            enable_preview = true
        },
        find_files = {
            search_dirs = {"../ble_stack_lib/src/ble_stack","." },
        },
        live_grep = {
            search_dirs = {"../ble_stack_lib/src/ble_stack","." },
        },
        live_grep_args ={
            search_dirs = {"../ble_stack_lib/src/ble_stack","." },
        },
        grep_string = {
            search_dirs = {"../ble_stack_lib/src/ble_stack","." },
        }
    }
    -- other configuration values here
})
vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"
require("telescope").load_extension "file_browser"
