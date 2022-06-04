require('telescope').setup({
    defaults = {
        layout_config = {
            -- vertical = { width = 0.9 }
            width = 0.95 
            -- other layout configuration here
        },
        -- other defaults configuration here
    },
    live_grep = {
        only_sort_text = true
    },
    extensions = {
        live_grep_raw = {
            auto_quoting = true, -- enable/disable auto-quoting
        }
    }
    -- other configuration values here
})
