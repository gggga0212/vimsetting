local actions = require("telescope.actions")
local lga_actions = require("telescope-live-grep-args.actions")
local sorters = require('telescope.sorters')
local previewers = require('telescope.previewers')
require('telescope').setup({
    defaults = {
        layout_config = {
            -- vertical = { width = 0.9 }
            width = 0.95,
            -- other layout configuration here
            horizontal = {
                prompt_position = "bottom",
            },
        },
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
        file_sorter = sorters.get_fzy_sorter,
        file_previewer = previewers.vim_buffer_cat.new,
        -- path_display = {"shorten"}, -- absolute
        -- layout_strategy = "vertical",
        -- layout_config = {mirror = true},
        sorting_strategy = "ascending",
        -- path_display = {"shorten"}, -- absolute
        path_display = {"tail"}, -- absolute
        -- other defaults configuration here
    },
    live_grep = {
        only_sort_text = true
    },
    extensions = {
        live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            mappings = {
                i = {
                    ["<C-k>"] = lga_actions.quote_prompt({ postfix = ' ../ble_stack_lib/src/ble_stack .' }),
                }
            }
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
        }
    }
    -- other configuration values here
})
vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"
require("telescope").load_extension "file_browser"
