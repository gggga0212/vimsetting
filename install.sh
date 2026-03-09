#!/bin/bash
set -e

# ─── Step 1: PPA + 基礎套件 ──────────────────────────────────────────
sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:ubuntu-support-team/gdb
sudo apt update
sudo apt install -y wget git gdb zsh curl unzip

# ─── Step 2: Clone repo ───────────────────────────────────────────────
git clone git@github.com:gggga0212/vimsetting.git ~/.config/nvim

# ─── Step 3: Oh-my-zsh（靜默安裝，不切換 shell）─────────────────────
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ─── Step 4: Neovim ───────────────────────────────────────────────────
NVIM_ARCHIVE="nvim-linux-x86_64"
NVIM_VERSION="v0.11.5"

cd ~/.config
rm -rf "${NVIM_ARCHIVE}.tar.gz" "${NVIM_ARCHIVE}.tar" "$NVIM_ARCHIVE"
wget "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/${NVIM_ARCHIVE}.tar.gz"
tar xzvf "${NVIM_ARCHIVE}.tar.gz"
rm -f "${NVIM_ARCHIVE}.tar.gz"

# ─── Step 5: LazyGit ─────────────────────────────────────────────────
# Windows 版（供 WSL 使用）
LZ_VERSION="0.57.0"
LZ_WIN_ZIP="lazygit_${LZ_VERSION}_windows_x86_64.zip"
rm -rf "$LZ_WIN_ZIP" lazygit_win
wget "https://github.com/jesseduffield/lazygit/releases/download/v${LZ_VERSION}/${LZ_WIN_ZIP}"
unzip "$LZ_WIN_ZIP" -d lazygit_win
rm -f "$LZ_WIN_ZIP"

# Linux 版
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm -f lazygit.tar.gz lazygit

# ─── Step 6: Zsh plugins ──────────────────────────────────────────────
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
git clone https://github.com/zsh-users/zsh-completions          "$ZSH_CUSTOM/plugins/zsh-completions"
git clone https://github.com/zsh-users/zsh-autosuggestions       "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-history-substring-search "$ZSH_CUSTOM/plugins/zsh-history-substring-search"
git clone https://github.com/zsh-users/zsh-syntax-highlighting   "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
git clone https://github.com/agkozak/zsh-z                       "$ZSH_CUSTOM/plugins/zsh-z"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"

# ─── Step 7: Node.js（LTS）───────────────────────────────────────────
curl -fsSL https://deb.nodesource.com/setup_24.x -o nodesource_setup.sh
sudo -E bash nodesource_setup.sh
sudo apt-get install -y nodejs

# ─── Step 8: 開發工具 ─────────────────────────────────────────────────
sudo apt-get install -y fonts-powerline tmux pip
sudo apt-get install -y exuberant-ctags cscope
sudo apt-get install -y gcc g++ make gdb
sudo apt-get install -y tree mscgen
sudo apt-get install -y ripgrep fd-find
sudo apt-get install -y python3
sudo apt-get install -y graphviz cflow gawk zip
sudo apt-get install -y cmatrix screenfetch
sudo ln -sf /usr/bin/python3 /usr/local/bin/python

# ─── Step 9: pip 套件 ─────────────────────────────────────────────────
pip install pynvim --upgrade
pip install openpyxl
pip3 install pandas

# ─── Step 10: ydiff ───────────────────────────────────────────────────
git clone https://github.com/ymattw/ydiff.git /tmp/ydiff
(cd /tmp/ydiff && python3 setup.py install)

# ─── Step 11: fzf ─────────────────────────────────────────────────────
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# ─── Step 12: tmux plugin manager ────────────────────────────────────
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# ─── Step 13: npm 全域工具 ────────────────────────────────────────────
sudo npm install -g diff-so-fancy
npm install -g tree-sitter-cli

# ─── Step 14: 複製 config 檔案 ────────────────────────────────────────
cp ~/.config/nvim/gitconfig ~/.gitconfig
cp ~/.config/nvim/tmux.conf ~/.tmux.conf
cp ~/.config/nvim/zshrc ~/.zshrc
mkdir -p ~/.config/lazygit
cp ~/.config/nvim/lz_config.yml ~/.config/lazygit/config.yml

# ─── Step 15: Claude CLI + Gemini CLI ────────────────────────────────
curl -fsSL https://claude.ai/install.sh | bash
npm install -g @google/gemini-cli

echo ""
echo "安裝完成！"
echo "1. 重新啟動終端（切換到 zsh）"
echo "2. 將 Neovim 加入 PATH："
echo "   export PATH=\"\$HOME/.config/nvim-linux-x86_64/bin:\$PATH\""
echo "3. 執行 nvim，等待 lazy.nvim 自動安裝套件"
echo "4. 重新啟動 nvim 後執行 :Mason 安裝 LSP 伺服器"
