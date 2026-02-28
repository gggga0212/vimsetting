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

Leader 鍵：`,`

**視窗切換**
| 按鍵 | 功能 |
|------|------|
| `Ctrl-H` | 移到左側視窗 |
| `Ctrl-J` | 移到下方視窗 |
| `Ctrl-K` | 移到上方視窗 |
| `Ctrl-L` | 移到右側視窗 |

**Cscope 查詢（`c*`）**
| 按鍵 | 功能 |
|------|------|
| `cg` | 跳至定義 |
| `cm` | 尋找所有符號參考 |
| `cc` | 尋找所有呼叫者 |
| `cd` | 尋找此函式所呼叫的函式 |
| `ct` | 尋找文字 |
| `ce` | egrep 搜尋 |
| `cf` | 開啟檔案 |
| `ci` | 尋找 include 此檔案的檔案 |
| `cv` | 在 Telescope 中開啟 quickfix 結果 |
| `cx` | 開啟 quickfix 視窗 |

**LSP（緩衝區內）**
| 按鍵 | 功能 |
|------|------|
| `gd` | 跳至定義 |
| `gD` | 跳至宣告 |
| `gk` | 顯示 hover 說明 |
| `gi` | 跳至實作 |
| `gr` | 顯示所有參考 |
| `<space>rn` | 重新命名 |
| `<space>ca` | 程式碼動作 |
| `<space>f` | 格式化 |

**Git（`<space>g*`）**
| 按鍵 | 功能 |
|------|------|
| `gj` | 預覽目前 hunk |
| `gn` | 下一個 hunk |
| `gp` | 上一個 hunk |
| `gu` | 還原 hunk |
| `<space>go` | DiffviewOpen（與 HEAD 比較）|
| `<space>gf` | 目前檔案的 git 歷史 |
| `<space>gh` | 整個專案的 git 歷史 |
| `<space>gl` | 開啟 LazyGit |
| `<space>gt` | Telescope git 狀態 |

**Telescope（`<space>t*` / `<leader>s*`）**
| 按鍵 | 功能 |
|------|------|
| `<leader>sf` | 搜尋檔案 |
| `<leader>st` | Live grep |
| `<leader>ss` | 搜尋游標下的字串 |
| `<leader>sd` | 診斷訊息 |
| `<space>tb` | 檔案瀏覽器 |
| `<space>tc` | 切換色彩主題 |
| `<space>tk` | 查看所有快捷鍵 |

**Calltree（呼叫樹）**
| 按鍵 | 功能 |
|------|------|
| `<leader>rr` | 顯示呼叫者樹（Cscope）|
| `<leader>rf` | 顯示被呼叫樹（Cscope）|
| `<leader>rR` | 顯示呼叫者樹（LSP）|
| `<leader>rF` | 顯示被呼叫樹（LSP）|
| `<leader>rq` | 關閉所有呼叫樹 |

**Floaterm（`<space>f*`）**
| 按鍵 | 功能 |
|------|------|
| `<space>ft` | 新增 floaterm |
| `<space>ff` | 切換 floaterm |
| `<space>fn` | 下一個 floaterm |
| `<space>fp` | 上一個 floaterm |
| `<space>fk` | 關閉 floaterm |

**Claude Code（`<leader>a*`）**
| 按鍵 | 功能 |
|------|------|
| `<leader>ac` | 開關 Claude Code |
| `<leader>af` | 聚焦 Claude Code |
| `<leader>ab` | 加入目前緩衝區 |
| `<leader>as` | 傳送選取內容（Visual 模式）|
| `<leader>aa` | 接受 diff |
| `<leader>ad` | 拒絕 diff |

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
