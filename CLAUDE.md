# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 概述

這是 Chang-Han（Sam）Kuo 的個人 Neovim 設定檔。使用 **lazy.nvim** 作為套件管理器，採用 vimscript 與 Lua 混合架構，主要針對 C/嵌入式開發工作流程，整合了 cscope、ctags 與 LSP 支援。

## 架構

### 進入點
- `init.vim` — 精簡的 vimscript 入口；載入 `lua/lazynvim.lua`（套件）與 `lua/options.lua`（設定與快捷鍵）

### 核心檔案
- `lua/lazynvim.lua` — 透過 `lazy.nvim` 宣告所有套件
- `lua/options.lua` — 所有 Neovim 選項、highlight 群組與快捷鍵；同時 `require` 所有 `lsp/` 模組
- `lua/lsp/` — 各套件的獨立設定模組（每個套件一個檔案）

### 套件設定模式
`lua/lsp/` 中的每個模組皆為獨立 Lua 模組，由 `options.lua` 呼叫。新增套件的步驟：
1. 在 `lua/lazynvim.lua` 中宣告套件
2. 建立 `lua/lsp/<plugin>.lua` 並撰寫其 `setup()` 呼叫
3. 在 `lua/options.lua` 中加入 `require "lsp.<plugin>"`

### LSP 堆疊
由 Mason 管理 LSP 伺服器安裝。已設定的伺服器：`clangd`、`pyright`、`lua_ls`（見 `lua/lsp/mason.lua`）。

### 程式碼導航
雙重導航系統：
- **Cscope**（`cscope_maps.nvim`）：C 符號搜尋，結果顯示於 quickfix。資料庫檔案：`./cscope.out`。按 `F6` 建置（產生 `cscope.files` 並重建資料庫）。
- **ctags**：`./tags`。按 `F12` 建置。
- **Telescope**：檔案模糊搜尋、live grep、git 狀態、診斷訊息等。
- **Calltree**（`calltree.nvim`）：使用 cscope 或 LSP 顯示呼叫者/被呼叫者樹狀結構。

### 快捷鍵摘要
- Leader 鍵：`,`
- `<space>` 前綴：主要功能切換（git、telescope、floaterm、檔案樹、LSP）
- `<leader>` 前綴：buffer/tab 導航、cscope calltree、快速操作
- `c*` 前綴：cscope 查詢（`cg`=定義、`cm`=符號、`cc`=呼叫者、`cd`=被呼叫函式等）
- `g*`：gitsigns（程式碼區塊）、LSP（`gd`=定義、`gD`=宣告、`gk`=hover、`gi`=實作、`gr`=參考）
- `<space>g*`：git/diffview 操作
- `<space>t*`：telescope 選擇器與其他工具
- `<space>f*`：floaterm 管理
- `<space>a*`：Claude Code 整合（`<leader>ac`=開關、`<leader>ab`=加入緩衝區、`<leader>as`=傳送選取內容）

## 套件更新

在 Neovim 內執行：
```
:Lazy sync      " 更新所有套件
:Lazy           " 開啟 lazy.nvim 介面
```

## Cscope 工作流程（C 專案）

1. `F6` — 產生 `cscope.files`（尋找所有 `.c`/`.h`）並建置 `cscope.out`
2. `F12` — 透過 ctags 產生 `tags`
3. 使用 `cg`、`cm`、`cc` 等進行導航（結果顯示於 quickfix）
4. `cv` — 在 Telescope 中開啟 quickfix 結果；`cx` — 開啟原始 quickfix 視窗

## LSP 管理

```
:Mason          " 管理已安裝的 LSP 伺服器
:LspStop        " <space>tq
:LspRestart     " <space>tQ
```
