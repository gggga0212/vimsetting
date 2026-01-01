# OpenBMC AST2600 開發相關函式
# 1. 下載所有必要的原始碼 (Fetch all)
bf() {
    cd ~/AST2600_qemu/openbmc && \
    . setup ast2600-default as26_build && \
    bitbake obmc-phosphor-image --runall=fetch
}

# 2. 執行編譯 (Build)
bb() {
    cd ~/AST2600_qemu/openbmc && \
    . setup ast2600-default as26_build && \
    bitbake obmc-phosphor-image
}

# 3. 執行 QEMU 模擬器 (Run QEMU)
runbmc() {
    # 先確保路徑正確並複製 Image
    local BUILD_DIR="$HOME/AST2600_qemu/openbmc/as26_build"
    
    cp "${BUILD_DIR}/tmp/deploy/images/ast2600-default/obmc-phosphor-image-ast2600-default.static.mtd" "${BUILD_DIR}/ast2600.static.mtd" && \
    cd "${BUILD_DIR}" && \
    ./qemu-system-arm -m 1024 \
        -M ast2600-evb \
        -nographic \
        -drive file=./ast2600.static.mtd,format=raw,if=mtd \
        -net nic \
        -net user,hostfwd=::3333-:22,hostfwd=::2443-:443,hostfwd=udp::2623-:623,hostname=qemu
}

=====================================
# OpenBMC AST2700 開發相關函式
# 1. 下載所有必要的原始碼 (Fetch all)
bf() {
    cd ~/AST2700_qemu/openbmc && \
    . setup ast2700-default as27_build && \
    bitbake obmc-phosphor-image --runall=fetch
}

# 2. 執行編譯 (Build)
bb() {
    cd ~/AST2700_qemu/openbmc && \
    . setup ast2700-default as27_build && \
    bitbake obmc-phosphor-image
}

# 3. 執行 QEMU 模擬器 (Run QEMU)
runbmc() {
    # 先確保路徑正確並複製 Image
    local BUILD_DIR="$HOME/AST2700_qemu/openbmc/as27_build"
    
    cp "${BUILD_DIR}/tmp/deploy/images/ast2700-default/obmc-phosphor-image-ast2700-default.static.mtd" "${BUILD_DIR}/ast2700.static.mtd" && \
    cd "${BUILD_DIR}" && \
    ./qemu-system-arm -m 1024 \
        -M ast2700-evb \
        -nographic \
        -drive file=./ast2700.static.mtd,format=raw,if=mtd \
        -net nic \
        -net user,hostfwd=::3333-:22,hostfwd=::2443-:443,hostfwd=udp::2623-:623,hostname=qemu
}

