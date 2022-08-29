require('better-comment').Setup({
    tags = {
        {
            name = "TODO",
            fg = "white",
            bg = "#0a7aca",
            bold = true,
            virtual_text = "",
        },
        {
            name = " ",
            fg = "black",
            bg = "#A9A9A9",
            bold = true,
            virtual_text = "",
        },
        {
            name = "*",
            fg = "white",
            bg = "#191970",
            bold = true,
            virtual_text = "",
        },
        {
            name = "!",
            fg = "white",
            bg = "#f44747",
            bold = true,
            virtual_text = "",
        }    -- TODO will overwrite
    }
})
