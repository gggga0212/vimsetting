require('telescope').setup({
    defaults = {
        layout_config = {
            -- vertical = { width = 0.9 }
            width = 0.95,
            -- other layout configuration here
            horizontal = {
                prompt_position = "bottom",
            }
        },
        -- other defaults configuration here
    },
    live_grep = {
        only_sort_text = true
    },
    extensions = {
        live_grep_raw = {
            auto_quoting = true, -- enable/disable auto-quoting
        },
        project = {
            base_dirs = {
                {'.'},
                {'../ble_stack_lib/src/ble_stack'},
            },
            hidden_files = true, -- default: false
            theme = "dropdown"
        }
    },
    pickers = {
        colorscheme = {
            enable_preview = true
        }
    }
    -- other configuration values here
})
