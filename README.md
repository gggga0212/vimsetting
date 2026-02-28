# Neovim 設定 by SamKuo

![quick_key](http://blog.vgod.tw/wp-content/uploads/2009/12/vim-cheat-sheet-full.png)
![quick_key2](http://www.viemu.com/vi-vim-cheat-sheet.gif)

## 安裝步驟（Ubuntu / Debian）

### Step 1：安裝基礎依賴並 clone 設定檔
```bash
bash install_1.sh
```
安裝內容：git、zsh、curl、npm、gdb、oh-my-zsh，並 clone 此 repo。

### Step 2：下載 Neovim 與 LazyGit
```bash
bash install_2.sh
```
下載 Neovim v0.11.5（`nvim-linux-x86_64`）並解壓縮至 `~/.config/`。
同時下載 LazyGit Windows 版（供 WSL 使用）。

將 Neovim 加入 PATH（加入 `~/.zshrc` 或 `~/.bashrc`）：
```bash
export PATH="$HOME/.config/nvim-linux-x86_64/bin:$PATH"
```

### Step 3：完整環境安裝
```bash
bash install_3.sh
```
安裝內容包含：
- LazyGit（Linux 版）
- zsh 插件：zsh-autosuggestions、zsh-syntax-highlighting、zsh-z、powerlevel10k
- Node.js（LTS）、Python3、pip
- 開發工具：gcc、g++、make、gdb、ctags、cscope、ripgrep、fd-find、graphviz、mscgen
- fzf、tmux、diff-so-fancy
- Claude CLI、Gemini CLI
- 複製設定檔：`~/.gitconfig`、`~/.tmux.conf`、`~/.zshrc`、lazygit config

### Step 4：啟動 Neovim，自動安裝套件
```bash
nvim
```
首次啟動時，lazy.nvim 會自動安裝所有套件。安裝完成後重新啟動 Neovim。

### Step 5：安裝 LSP 伺服器
進入 Neovim 後執行：
```
:Mason
```
預設會自動安裝 `clangd`、`pyright`、`lua_ls`。

## 套件管理

本設定使用 [lazy.nvim](https://github.com/folke/lazy.nvim) 作為套件管理器。

```
:Lazy          " 開啟套件管理介面
:Lazy sync     " 更新所有套件
```

## 首次使用（C 專案）

進入專案目錄後：
1. `F6` — 建立 `cscope.files` 並產生 `cscope.out` 資料庫
2. `F12` — 產生 `tags`（ctags）
3. 開始使用 cscope 快捷鍵進行程式碼導航

## 快捷鍵

### 視窗切換
| 按鍵 | 功能 |
|------|------|
| `Ctrl-H` | 移到左側視窗 |
| `Ctrl-J` | 移到下方視窗 |
| `Ctrl-K` | 移到上方視窗 |
| `Ctrl-L` | 移到右側視窗 |

### Cscope 查詢（`c*`）
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

### LSP（緩衝區內）
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

### Git（`<space>g*`）
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

### Telescope（`<space>t*` / `<leader>s*`）
| 按鍵 | 功能 |
|------|------|
| `<leader>sf` | 搜尋檔案 |
| `<leader>st` | Live grep |
| `<leader>ss` | 搜尋游標下的字串 |
| `<leader>sd` | 診斷訊息 |
| `<space>tb` | 檔案瀏覽器 |
| `<space>tc` | 切換色彩主題 |
| `<space>tk` | 查看所有快捷鍵 |

### Calltree（呼叫樹）
| 按鍵 | 功能 |
|------|------|
| `<leader>rr` | 顯示呼叫者樹（Cscope）|
| `<leader>rf` | 顯示被呼叫樹（Cscope）|
| `<leader>rR` | 顯示呼叫者樹（LSP）|
| `<leader>rF` | 顯示被呼叫樹（LSP）|
| `<leader>rq` | 關閉所有呼叫樹 |

### Floaterm（`<space>f*`）
| 按鍵 | 功能 |
|------|------|
| `<space>ft` | 新增 floaterm |
| `<space>ff` | 切換 floaterm |
| `<space>fn` | 下一個 floaterm |
| `<space>fp` | 上一個 floaterm |
| `<space>fk` | 關閉 floaterm |

### Claude Code（`<leader>a*`）
| 按鍵 | 功能 |
|------|------|
| `<leader>ac` | 開關 Claude Code |
| `<leader>af` | 聚焦 Claude Code |
| `<leader>ab` | 加入目前緩衝區 |
| `<leader>as` | 傳送選取內容（Visual 模式）|
| `<leader>aa` | 接受 diff |
| `<leader>ad` | 拒絕 diff |

## 主要套件

| 套件 | 用途 |
|------|------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | 套件管理器 |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP 伺服器管理 |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP 設定 |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | 模糊搜尋 |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | 語法高亮與解析 |
| [cscope_maps.nvim](https://github.com/dhananjaylatkar/cscope_maps.nvim) | Cscope 整合 |
| [calltree.nvim](https://github.com/daishengdong/calltree.nvim) | 呼叫樹視圖 |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git 行內標示 |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Git diff 視圖 |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | LazyGit 整合 |
| [vim-floaterm](https://github.com/voldikss/vim-floaterm) | 浮動終端機 |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | 檔案樹 |
| [vim-airline](https://github.com/vim-airline/vim-airline) | 狀態列 |
| [claudecode.nvim](https://github.com/coder/claudecode.nvim) | Claude Code 整合 |

## 鍵盤設定參考

交換 Caps Lock 與 Ctrl（Linux）：
```bash
# 編輯 /etc/default/keyboard
XKBOPTIONS="ctrl:swapcaps"   # 互換
XKBOPTIONS="ctrl:nocaps"     # Caps Lock 改為 Ctrl
# 修改後重新開機
```

## 參考資源

- [Vim 基本指令](http://blog.jex.tw/blog/2013/05/15/vim/)
- [Vim 速查表](http://blog.vgod.tw/wp-content/uploads/2009/12/vim-cheat-sheet-full.png)

## 作者

Chang-Han, Kuo
