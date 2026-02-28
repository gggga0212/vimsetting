# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration by Chang-Han (Sam) Kuo. It uses **lazy.nvim** as the plugin manager with a hybrid vimscript/Lua setup, targeting C/embedded development workflows with cscope, ctags, and LSP support.

## Architecture

### Entry Point
- `init.vim` — minimal vimscript entry; loads `lua/lazynvim.lua` (plugins) and `lua/options.lua` (settings + keymaps)

### Key Files
- `lua/lazynvim.lua` — all plugin declarations via `lazy.nvim`
- `lua/options.lua` — all Neovim options, highlight groups, and keymaps; also `require`s every `lsp/` module
- `lua/lsp/` — per-plugin configuration modules (one file per plugin)

### Plugin Configuration Pattern
Each plugin in `lua/lsp/` is a standalone Lua module called from `options.lua`. Adding a new plugin means:
1. Declaring it in `lua/lazynvim.lua`
2. Creating `lua/lsp/<plugin>.lua` with its `setup()` call
3. Adding `require "lsp.<plugin>"` in `lua/options.lua`

### LSP Stack
Mason manages LSP server installation. Configured servers: `clangd`, `pyright`, `lua_ls` (see `lua/lsp/mason.lua`).

### Code Navigation
Dual navigation system:
- **Cscope** (`cscope_maps.nvim`): C symbol search via quickfix. DB file: `./cscope.out`. Build with `F6` (generates `cscope.files` and rebuilds db).
- **ctags**: `./tags`. Build with `F12`.
- **Telescope**: fuzzy search over files, live grep, git status, diagnostics, etc.
- **Calltree** (`calltree.nvim`): caller/callee tree views using cscope or LSP

### Key Mappings Summary
- Leader key: `,`
- `<space>` prefix: major feature toggles (git, telescope, floaterm, tree, LSP)
- `<leader>` prefix: buffer/tab navigation, cscope calltree, quick actions
- `c*` prefix: cscope queries (`cg`=definition, `cm`=symbol, `cc`=callers, `cd`=called-by, etc.)
- `g*`: gitsigns (hunks), LSP (gd=definition, gD=declaration, gk=hover, gi=implementation, gr=references)
- `<space>g*`: git/diffview operations
- `<space>t*`: telescope pickers and misc tools
- `<space>f*`: floaterm management
- `<space>a*`: Claude Code integration (`<leader>ac`=toggle, `<leader>ab`=add buffer, `<leader>as`=send selection)

## Updating Plugins

Inside Neovim:
```
:Lazy sync      " update all plugins
:Lazy           " open lazy.nvim UI
```

## Cscope Workflow (C projects)

1. `F6` — generate `cscope.files` (finds all `.c`/`.h`) and build `cscope.out`
2. `F12` — generate `tags` via ctags
3. Use `cg`, `cm`, `cc`, etc. for navigation (results in quickfix)
4. `cv` — open quickfix results in Telescope; `cx` — open raw quickfix window

## LSP Management

```
:Mason          " manage installed LSP servers
:LspStop        " <space>tq
:LspRestart     " <space>tQ
```
