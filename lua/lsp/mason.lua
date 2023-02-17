require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup {
    ensure_installed = {
        "bashls",
        "clangd",
        "cssls",
        "jsonls",
        "pyright",
        "lua_ls"
    },
}

local on_attach = function(_, _)
  -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

require("lspconfig").clangd.setup {
    on_attach = on_attach
}
require("lspconfig").lua_ls.setup {
    on_attach = on_attach
}
