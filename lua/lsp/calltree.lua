require("calltree").setup(
{
    prefix = "<leader>o", -- keep consistent with cscope_maps

    -- brief: only shows a symbol's name
    -- detailed: shows just more details
    -- detailed_paths: shows filename and line number
    tree_style = "detailed", -- alternatives: detailed, detailed_paths, brief
})
