#!/bin/bash
#
# JM OpenBMC 環境設定腳本
# 請以 source 方式執行以保留環境變數： source setup_opbmc_jm.sh
#

# Build and run on Qemu
# bitbake fpga-image-initramfs or bitbake fpga-image-initramfs-webui 
# U_BOOT_BIN="$BBPATH/tmp/deploy/images/mercury-fpga/u-boot.bin" 
# LINUX_FIT="$BBPATH/tmp/deploy/images/mercury-fpga/fitImage-fpga-image-initramfs-mercury-fpga-mercury-fpga" 
# qemu-system-aarch64 -s -M jm-mercury-fpga -smp cpus=1 -nographic \ 
#     -serial mon:stdio \ 
#     -device loader,addr=0x80000000,cpu-num=0 \ 
#     -device "loader,file=$U_BOOT_BIN,addr=0x80000000,force-raw=on" \ 
#     -device "loader,file=$LINUX_FIT,addr=0x88000000,force-raw=on" 

WORK_DIR="/home/samkuo/JM/openbmc-private"

show_menu() {
    clear
    echo "┌────────────────────────────────────────────────────────┐"
    echo "│  JM OpenBMC - Platform Selection                      │"
    echo "└────────────────────────────────────────────────────────┘"
    echo ""
    echo "  1: Use Poky distro"
    echo "    TEMPLATECONF=meta-jmicron/meta-mercury-poky/conf/templates/default source oe-init-build-env build/mercury-fpga-poky"
    echo "  2: Use OpenBMC phosphor distro on QEMU"
    echo "    . ./setup mercury-qemu-webui"
    echo "  3: Use OpenBMC phosphor distro on FPGA"
    echo "    . ./setup mercury-fpga-webui"
    echo "  q: Quit"
    echo ""
    echo -n "  Please select an option: "
}

run_poky() {
    if [ ! -d "meta-jmicron/meta-mercury-poky/conf/templates/default" ]; then
        echo "Error: meta-jmicron/meta-mercury-poky/conf/templates/default not found."
        echo "Please run this script from $WORK_DIR"
        return 1
    fi
    echo ">>> TEMPLATECONF=meta-jmicron/meta-mercury-poky/conf/templates/default source oe-init-build-env build/mercury-fpga-poky"
    TEMPLATECONF=meta-jmicron/meta-mercury-poky/conf/templates/default source oe-init-build-env build/mercury-fpga-poky
    bitbake fpga-image-initramfs
}

run_phosphor_qemu() {
    if [ ! -f "setup" ]; then
        echo "Error: setup not found in current directory."
        echo "Please run this script from $WORK_DIR"
        return 1
    fi
    echo ">>> . ./setup mercury-qemu-webui"
    . ./setup mercury-qemu-webui
    bitbake fpga-image-initramfs-webui

}

run_phosphor_fpga() {
    if [ ! -f "setup" ]; then
        echo "Error: setup not found in current directory."
        echo "Please run this script from $WORK_DIR"
        return 1
    fi
    echo ">>> . ./setup mercury-fpga-webui"
    . ./setup mercury-fpga-webui
    bitbake qemu-image-initramfs-webui
}

# 進入工作目錄
if [ ! -d "$WORK_DIR" ]; then
    echo "Error: Working directory does not exist: $WORK_DIR"
    return 1 2>/dev/null || exit 1
fi

echo ">>> cd $WORK_DIR"
cd "$WORK_DIR" || return 1 2>/dev/null || exit 1

# 主選單迴圈（僅在未 source 子環境時會繼續）
while true; do
    show_menu
    read -r choice

    case "$choice" in
        1)
            run_poky
            break
            ;;
        2)
            run_phosphor_qemu
            break
            ;;
        3)
            run_phosphor_fpga
            break
            ;;
        q|Q)
            echo "Bye."
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            sleep 2
            ;;
    esac
done

