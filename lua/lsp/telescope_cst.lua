
local actions = require("telescope.actions")
-- local lga_actions = require("telescope-live-grep-args.actions")
local sorters = require('telescope.sorters')
local previewers = require('telescope.previewers')
local fb_actions = require "telescope._extensions.file_browser.actions"
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
        -- file_ignore_patterns = {
        --     "./firmware/src/config/default/ble/service_ble"},
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
            },
        file_browser = {
            path = vim.loop.cwd(),
            cwd = vim.loop.cwd(),
            cwd_to_path = false,
            grouped = false,
            files = true,
            add_dirs = true,
            depth = 1,
            auto_depth = false,
            select_buffer = false,
            hidden = { file_browser = false, folder_browser = false },
            respect_gitignore = vim.fn.executable "fd" == 1,
            no_ignore = false,
            follow_symlinks = false,
            browse_files = require("telescope._extensions.file_browser.finders").browse_files,
            browse_folders = require("telescope._extensions.file_browser.finders").browse_folders,
            hide_parent_dir = false,
            collapse_dirs = false,
            prompt_path = false,
            quiet = false,
            dir_icon = "",
            dir_icon_hl = "Default",
            display_stat = { date = true, size = true, mode = true },
            hijack_netrw = false,
            use_fd = true,
            git_status = true,
            mappings = {
                ["i"] = {
                    ["<A-c>"] = fb_actions.create,
                    ["<S-CR>"] = fb_actions.create_from_prompt,
                    ["<A-r>"] = fb_actions.rename,
                    ["<A-m>"] = fb_actions.move,
                    ["<A-y>"] = fb_actions.copy,
                    ["<A-d>"] = fb_actions.remove,
                    ["<C-o>"] = fb_actions.open,
                    ["<C-g>"] = fb_actions.goto_parent_dir,
                    ["<C-e>"] = fb_actions.goto_home_dir,
                    ["<C-w>"] = fb_actions.goto_cwd,
                    ["<C-t>"] = fb_actions.change_cwd,
                    ["<C-f>"] = fb_actions.toggle_browser,
                    ["<C-h>"] = fb_actions.toggle_hidden,
                    ["<C-s>"] = fb_actions.toggle_all,
                    ["<bs>"] = fb_actions.backspace,
                },
                ["n"] = {
                    ["c"] = fb_actions.create,
                    ["r"] = fb_actions.rename,
                    ["m"] = fb_actions.move,
                    ["y"] = fb_actions.copy,
                    ["d"] = fb_actions.remove,
                    ["o"] = fb_actions.open,
                    ["g"] = fb_actions.goto_parent_dir,
                    ["e"] = fb_actions.goto_home_dir,
                    ["w"] = fb_actions.goto_cwd,
                    ["t"] = fb_actions.change_cwd,
                    ["f"] = fb_actions.toggle_browser,
                    ["h"] = fb_actions.toggle_hidden,
                    ["s"] = fb_actions.toggle_all,
                },
            },
        },
    },
    pickers = {
        colorscheme = {
            enable_preview = true
        },
        find_files = {
            search_dirs = {"." },
        },
        live_grep = {
            search_dirs = {"." },
        },
        live_grep_args ={
            search_dirs = {"." },
        },
        grep_string = {
            search_dirs = {"." },
        }
    }
    -- other configuration values here
})
vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"
require("telescope").load_extension "file_browser"
