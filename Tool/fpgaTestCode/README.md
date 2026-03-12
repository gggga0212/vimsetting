# testCode Builder

一個 Windows 桌面 GUI 工具，用於瀏覽 FPGA testCode 資料夾內的 `.c` 檔案、在內建編輯器中修改，並一鍵透過 WSL 執行 `build.sh` 進行編譯。

---

## 專案結構

```
fpgaTestCode/
├── testCode_builder.py   ← 主程式
└── README.md             ← 本說明文件
```

---

## 環境需求

| 項目 | 最低版本 | 備註 |
|------|----------|------|
| Windows | 10 / 11 | |
| Python | 3.8+ | 內建 `tkinter`，無需額外安裝套件 |
| WSL2 | — | 需安裝並啟用 |
| WSL 發行版 | Ubuntu-24.04 | 預設使用，可修改程式碼改為其他發行版 |

> Python 官方下載：https://www.python.org/downloads/

---

## 啟動方式

### 直接執行
```bash
python testCode_builder.py
```

### 打包成 .exe（方便散佈給無 Python 的電腦）
```bash
pip install pyinstaller
pyinstaller --onefile --windowed testCode_builder.py
# 產出：dist/testCode_builder.exe
```

---

## GUI 操作說明

```
+----------------------------------------------+
| testCode 資料夾: [C:\...\testCode    ] [Browse] |
+----------------------------------------------+
|  檔案樹（左）         |  程式碼編輯器（右）      |
|                      |  filename.c  *          |
|  📁 testCode         |                         |
|  ├─ 📁 projA         |  #include <stdio.h>     |
|  │   └─ 📄 vga.c     |  int main() { ... }     |
|  └─ 📁 projB         |                         |
|      └─ 📄 uart.c    |                         |
+------[Build Selected]--[Save (Ctrl+S)]--------+
| build.sh found: build.sh                      |
+-----------------------------------------------+
```

### 上方工具列
| 控制項 | 說明 |
|--------|------|
| **testCode 資料夾** 文字框 | 顯示目前選擇的 testCode 根目錄 |
| **Browse** 按鈕 | 開啟資料夾選擇對話框 |

### 左側檔案樹
| 操作 | 動作 |
|------|------|
| 單擊 `.c` 檔 | 載入至右側編輯器 |
| 雙擊 `.c` 檔 | 直接執行 Build |

### 右側編輯器
| 功能 | 說明 |
|------|------|
| 直接編輯 | 支援 Undo / Redo（`Ctrl+Z` / `Ctrl+Y`）|
| 標題顯示 `*` | 表示檔案有未儲存的修改 |
| `Ctrl+S` | 儲存目前檔案 |
| 切換檔案時 | 若有未儲存修改，會詢問是否儲存 |

### 下方按鈕
| 按鈕 | 說明 |
|------|------|
| **Build Selected** | 自動儲存 → 開啟 Ubuntu-24.04 視窗執行 `./build.sh` |
| **Save (Ctrl+S)** | 儲存目前編輯的檔案（有修改時才可點擊）|

### 狀態列
底部藍色狀態列顯示目前狀態，例如：
- `build.sh found: build.sh` — 找到編譯腳本
- `Opened: vga_800.c` — 已載入檔案
- `Saved: vga_800.c` — 儲存成功
- `Launched: ./build.sh projA/vga_800.c` — 已啟動 build

---

## build.sh 搜尋規則

程式啟動或選擇資料夾後，會從 testCode 根目錄開始**逐層（BFS）搜尋** `build.sh`，找到第一個即停止使用。

```
testCode/
├── build.sh          ← 優先找到這個
├── projA/
│   ├── build.sh      ← 若根目錄沒有，才找這裡
│   └── vga_800.c
└── projB/
    └── uart_test.c
```

---

## Build 執行流程

點擊 **Build Selected** 後，程式執行以下動作：

1. 若編輯器有未儲存內容 → 自動儲存
2. 計算 `.c` 檔相對於 `build.sh` 的**相對路徑**
3. 將 Windows 路徑轉換為 WSL 路徑（`C:\foo` → `/mnt/c/foo`）
4. 開啟 Ubuntu-24.04 視窗執行：

```bash
cd /mnt/c/.../testCode
./build.sh projA/vga_800.c
```

5. Build 完成後終端機顯示 `Press Enter to close...` 等待關閉

---

## 設定持久化

上次選擇的 testCode 路徑會自動儲存於：

```
%APPDATA%\testcode_builder.json
```

下次開啟程式時自動載入，無需重新 Browse。

---

## 常見問題

**Q: 程式開啟後 TreeView 是空的**
- 點擊 Browse 選擇正確的 testCode 資料夾

**Q: 狀態列顯示 `WARNING: build.sh not found`**
- 確認 testCode 資料夾內（或子資料夾）有 `build.sh` 且名稱完全一致

**Q: Build 後沒有開啟終端機視窗**
- 確認 WSL2 已安裝：`wsl --list --verbose`
- 若發行版不是 Ubuntu-24.04，修改 `testCode_builder.py` 第 318 行的 `-d Ubuntu-24.04`

**Q: 在其他電腦無法執行 `.py`**
- 安裝 Python 3.8+，或改用打包好的 `.exe`（見「打包成 .exe」章節）

**Q: 中文顯示亂碼**
- 確認 Python 版本 >= 3.8，且系統支援 UTF-8 locale
