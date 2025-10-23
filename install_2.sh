#!/bin/bash
#nvim
cd ~/.config
# rm -rf nvim-linux64.tar.gz
# rm -rf nvim-linux64.tar
# rm -rf nvim-linux64
# wget https://github.com/neovim/neovim/releases/download/v0.10.3/nvim-linux64.tar.gz
# tar xzvf nvim-linux64.tar.gz

NVIM_ARCHIVE="nvim-linux-x86_64"
NVIM_VERSION="v0.11.4"
DOWNLOAD_URL="https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/${NVIM_ARCHIVE}.tar.gz"

rm -rf "${NVIM_ARCHIVE}.tar.gz" "${NVIM_ARCHIVE}.tar" "$NVIM_ARCHIVE"
wget "$DOWNLOAD_URL"
tar xzvf "${NVIM_ARCHIVE}.tar.gz"
