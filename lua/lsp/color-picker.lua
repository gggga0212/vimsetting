local opts = { noremap = true, silent = true }


require("color-picker").setup({ -- for changing icons & mappings
["icons"] = { "ﱢ", "" },
["keymap"] = { -- mapping example:
["U"] = "<Plug>Slider5Decrease",
["O"] = "<Plug>Slider5Increase",
    },
})
vim.cmd([[hi FloatBorder guibg=NONE]]) 
