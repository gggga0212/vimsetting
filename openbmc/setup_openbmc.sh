#!/bin/bash

# Change to home directory first

# Default platform
CURRENT_PLATFORM="AST2700_qemu"

# Show menu
show_menu() {
    clear
    echo "┌────────────────────────────────────────┐"
    echo "│  Platform Selection                    │"
    echo "└────────────────────────────────────────┘"
    echo "  1: Change OpenBMC Version"
    if [ "$CURRENT_PLATFORM" = "AST2600_qemu" ]; then
		echo "     (V) AST2600_qemu (current)"
		echo "     ( ) AST2700_qemu"
    else
		echo "     ( ) AST2600_qemu"
        echo "     (V) AST2700_qemu (current)"
    fi
    echo "┌────────────────────────────────────────┐"
    echo "│  OpenBMC                               │"
    echo "└────────────────────────────────────────┘"
    echo "  2: Clone OpenBMC and Download"
    echo "  3: Re-download"
    echo "  4: Build OpenBMC MTD"
    echo "┌────────────────────────────────────────┐"
    echo "│  QEMU                                  │"
    echo "└────────────────────────────────────────┘"
    echo "  5: Setup QEMU"
    echo "  6: Run QEMU"
    echo "┌────────────────────────────────────────┐"
    echo "│  Devtool                               │"
    echo "└────────────────────────────────────────┘"
    echo "  7: Linux Kernel Menuconfig"
    echo "  q: Quit"
    echo -n "  Please select an option: "
}

# Change platform
openbmc_change_platform() {
    clear
    echo "=========================================="
    echo "      Change Platform"
    echo "=========================================="
    echo ""
    echo "Current Platform: $CURRENT_PLATFORM"
    echo ""
    echo "1: AST2600_qemu"
    echo "2: AST2700_qemu"
    echo "3: Back to main menu"
    echo ""
    echo -n "Please select a platform: "
    read platform_choice
    
    case $platform_choice in
        1)
            CURRENT_PLATFORM="AST2600_qemu"
            echo "Platform changed to AST2600_qemu"
            sleep 2
            ;;
        2)
            CURRENT_PLATFORM="AST2700_qemu"
            echo "Platform changed to AST2700_qemu"
            sleep 2
            ;;
        3)
            return
            ;;
        *)
            echo "Invalid option"
            sleep 2
            ;;
    esac
}

# Clone and set env
openbmc_clone_and_download() {
    clear
    echo "=========================================="
    echo "      Clone OpenBMC and Download"
    echo "=========================================="
    echo "Platform: $CURRENT_PLATFORM"
    echo ""
    
    echo "Setting up $CURRENT_PLATFORM..."
    
    # Save current directory
    ORIGINAL_DIR=$(pwd)
    
    # Set platform-specific parameters
    if [ "$CURRENT_PLATFORM" = "AST2600_qemu" ]; then
        PLATFORM_DIR="$HOME/AST2600_qemu"
        SETUP_ARGS="ast2600-default as26_build"
    else
        PLATFORM_DIR="$HOME/AST2700_qemu"
        SETUP_ARGS="ast2700-default as27_build"
    fi
    
    # Create platform directory
    mkdir -p "$PLATFORM_DIR"
    
    # Clone repository
    if [ "$CURRENT_PLATFORM" = "AST2600_qemu" ]; then
        git clone https://github.com/AspeedTech-BMC/openbmc.git "$PLATFORM_DIR/openbmc"
    else
        git clone -b v09.06 https://github.com/AspeedTech-BMC/openbmc.git "$PLATFORM_DIR/openbmc"
    fi
    
    cd "$PLATFORM_DIR/openbmc" || exit
    
    # Setup environment
    . ./setup $SETUP_ARGS
    
    # Install dependencies (shared by both platforms)
    sudo apt update
    sudo apt install -y git gcc g++ make file wget gawk diffstat bzip2 cpio chrpath zstd lz4 bzip2 tio
    sudo locale-gen en_US.UTF-8
    bitbake obmc-phosphor-image --runall=fetch
    echo ""
    echo "$CURRENT_PLATFORM environment setup completed!"
    echo ""
    echo "Press Enter to continue..."
    read
}

# Build or download image (unified function)
# Usage: build_or_download_image <action>
# action: "download" for --runall=fetch, "build" for normal build
build_or_download_image() {
    local action=$1
    local title
    local message
    local bitbake_cmd
    
    if [ "$action" = "download" ]; then
        title="Download Image"
        message="Downloading"
        bitbake_cmd="bitbake obmc-phosphor-image --runall=fetch"
        completion_msg="Download completed!"
    else
        title="Build Image"
        message="Building"
        bitbake_cmd="bitbake obmc-phosphor-image"
        completion_msg="Build completed!"
    fi
    
    clear
    echo "=========================================="
    echo "      $title"
    echo "=========================================="
    echo "Platform: $CURRENT_PLATFORM"
    echo ""
     # Save current directory
    ORIGINAL_DIR=$(pwd)
    # Set directory path based on current platform
    PLATFORM_DIR="$HOME/$CURRENT_PLATFORM"
    OPENBMC_DIR="$PLATFORM_DIR/openbmc"
    
    # Check if environment exists
    if [ ! -d "$PLATFORM_DIR" ] || [ ! -d "$OPENBMC_DIR" ]; then
        echo "Error: $CURRENT_PLATFORM environment not found. Please run option 2 first."
        echo ""
        echo "Press Enter to continue..."
        read
        return 1
    fi
    
    # Enter openbmc directory and execute build/download
    if cd "$OPENBMC_DIR" 2>/dev/null; then
        echo "${message} image for $CURRENT_PLATFORM..."
        if [ "$CURRENT_PLATFORM" = "AST2600_qemu" ]; then
            SETUP_ARGS="ast2600-default as26_build"
        else
            SETUP_ARGS="ast2700-default as27_build"
        fi
        # Setup environment
        . setup $SETUP_ARGS
        $bitbake_cmd
        # Return to original directory
        cd "$ORIGINAL_DIR" || return
        echo "$completion_msg"
    else
        echo "Error: Cannot access $OPENBMC_DIR directory."
        cd "$ORIGINAL_DIR" || return
    fi
    
    echo ""
    echo "Press Enter to continue..."
    read
}

# Download image
openbmc_download_image() {
    build_or_download_image "download"
}

# Build image
openbmc_build_image() {
    build_or_download_image "build"
}

# Setup Qemu
qemu_setup() {
    clear
    echo "=========================================="
    echo "      Setup Qemu"
    echo "=========================================="
    echo "Platform: $CURRENT_PLATFORM"
    echo ""
    
    # Save current directory
    ORIGINAL_DIR=$(pwd)
    
    if [ "$CURRENT_PLATFORM" = "AST2600_qemu" ]; then
        echo "Setting up QEMU for AST2600..."
        echo ""
        cd "$HOME/AST2600_qemu"
        # Install QEMU packages
        sudo apt install qemu-system qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager -y
        
        # Download qemu-system-arm
        wget https://jenkins.openbmc.org/job/latest-qemu-x86/lastSuccessfulBuild/artifact/qemu/build/qemu-system-arm
        
        # Add execute permission
        chmod a+x qemu-system-arm
        
        echo ""
        echo "AST2600 QEMU setup completed!"
    else
        echo "Setting up QEMU for AST2700..."
        echo ""
        
        # Install QEMU packages
        sudo apt install qemu-system qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager -y
        
        # Install build dependencies
        sudo apt install -y build-essential libglib2.0-dev libpixman-1-dev zlib1g-dev git python3-pip ninja-build python3-venv libslirp-dev
        
        # Install tomli
        pip install tomli
        
        # Install additional packages
        sudo apt install pkg-config -y
        sudo apt install cmake libgtk-3-dev -y
        cd "$HOME/AST2700_qemu"
        # Clone QEMU repository
        git clone https://gitlab.com/qemu-project/qemu.git
        cd qemu || exit
        
        # Show available versions
        echo "Available QEMU versions:"
        git tag | sort -V
        
        # Checkout specific version for AST2700
        echo ""
        echo "Checking out v10.1.0-rc4 (required for 2700fc with A35 + M4*2)..."
        git checkout v10.1.0-rc4
        
        # Build QEMU
        mkdir -p build
        cd build || exit
        ../configure --target-list=aarch64-softmmu --enable-slirp --enable-debug --enable-gtk
        echo ""
        echo "Building QEMU (this may take a while)..."
        sudo make -j$(nproc)
        echo ""
        echo "Installing QEMU..."
        sudo make install
        
        # Return to original directory
        cd "$ORIGINAL_DIR" || return
        
        echo ""
        echo "AST2700 QEMU setup completed!"
    fi
    
    echo ""
    echo "Press Enter to continue..."
    read
}

# Run Qemu
qemu_run() {
    clear
    echo "=========================================="
    echo "      Run Qemu"
    echo "=========================================="
    echo "Platform: $CURRENT_PLATFORM"
    echo ""
    
    # Save current directory
    ORIGINAL_DIR=$(pwd)
    
    # Set platform-specific paths
    PLATFORM_DIR="$HOME/$CURRENT_PLATFORM"
    OPENBMC_DIR="$PLATFORM_DIR/openbmc"
    
    if [ "$CURRENT_PLATFORM" = "AST2600_qemu" ]; then
        echo "Running QEMU for AST2600..."
        echo ""
    # Set AST2600 specific paths
    IMG_BASE_DIR="$OPENBMC_DIR/as26_build"
    cd "$IMG_BASE_DIR" || exit
    cp ./tmp/deploy/images/ast2600-default/obmc-phosphor-image-ast2600-default.static.mtd ./ast2600.static.mtd
    ../../qemu-system-arm -m 1024 -M ast2600-evb -nographic -drive file=./ast2600.static.mtd,format=raw,if=mtd -net nic -net user,hostfwd=::3333-:22,hostfwd=::2443-:443,hostfwd=udp::2623-:623,hostname=qemu
    else
        echo "Running QEMU for AST2700..."
        echo ""
        
        # Set AST2700 specific paths
        IMG_BASE_DIR="$OPENBMC_DIR/as27_build/tmp/deploy/images"
        IMGDIR="$IMG_BASE_DIR/ast2700-default"
        
        # Check if build directory exists
        if [ ! -d "$IMGDIR" ]; then
            cd "$ORIGINAL_DIR"
            echo "Error: AST2700 build directory not found. Please run option 4 (Build image) first."
            echo ""
            echo "Press Enter to continue..."
            read
            return 1
        fi
        
        # Check if qemu-system-aarch64 exists
        if ! command -v qemu-system-aarch64 &> /dev/null; then
            cd "$ORIGINAL_DIR"
            echo "Error: qemu-system-aarch64 not found. Please run option 5 (Setup Qemu) first."
            echo ""
            echo "Press Enter to continue..."
            read
            return 1
        fi
        
        # Check if required files exist
        if [ ! -f "${IMGDIR}/u-boot-nodtb.bin" ] || [ ! -f "${IMGDIR}/u-boot.dtb" ] || [ ! -f "${IMGDIR}/bl31.bin" ]; then
            cd "$ORIGINAL_DIR"
            echo "Error: Required image files not found in ${IMGDIR}/"
            echo ""
            echo "Press Enter to continue..."
            read
            return 1
        fi
        
        # Calculate UBOOT_SIZE
        UBOOT_SIZE=$(stat --format=%s -L "${IMGDIR}/u-boot-nodtb.bin")
        
        echo "Starting QEMU for AST2700..."
        echo "Press Ctrl+A then X to exit QEMU"
        echo ""
        
        # Run QEMU
        qemu-system-aarch64 -M ast2700fc \
            -device loader,force-raw=on,addr=0x400000000,file="${IMGDIR}/u-boot-nodtb.bin" \
            -device loader,force-raw=on,addr=$((0x400000000 + ${UBOOT_SIZE})),file="${IMGDIR}/u-boot.dtb" \
            -device loader,force-raw=on,addr=0x430000000,file="${IMGDIR}/bl31.bin" \
            -device loader,force-raw=on,addr=0x430080000,file="${IMGDIR}/optee/tee-raw.bin" \
            -device loader,cpu-num=0,addr=0x430000000 \
            -device loader,cpu-num=1,addr=0x430000000 \
            -device loader,cpu-num=2,addr=0x430000000 \
            -device loader,cpu-num=3,addr=0x430000000 \
            -drive file="${IMGDIR}/image-bmc",if=mtd,format=raw \
            -device loader,file="${IMGDIR}/zephyr-aspeed-ssp.elf",cpu-num=4 \
            -device loader,file="${IMGDIR}/zephyr-aspeed-tsp.elf",cpu-num=5 \
            -serial pty -serial pty -serial pty \
            -net nic \
            -net user,hostfwd=tcp:127.0.0.1:5355-:5355,hostfwd=:127.0.0.1:2022-:22,hostfwd=:127.0.0.1:2443-:443,hostfwd=tcp:127.0.0.1:2080-:80,hostfwd=tcp:127.0.0.1:2200-:2200,hostfwd=udp:127.0.0.1:2623-:623,hostfwd=udp:127.0.0.1:2664-:664,hostname=qemu \
            -snapshot \
            -S -nographic
    fi
    cd "$ORIGINAL_DIR"
    echo ""
    echo "QEMU session ended."
    echo "Press Enter to continue..."
    read
}

# Linux Kernel Menuconfig
linux_menuconfig() {
    clear
    echo "=========================================="
    echo "      Linux Kernel Menuconfig"
    echo "=========================================="
    echo "Platform: $CURRENT_PLATFORM"
    echo ""
    
    # Save current directory
    ORIGINAL_DIR=$(pwd)
    
    # Set platform-specific paths
    PLATFORM_DIR="$HOME/$CURRENT_PLATFORM"
    OPENBMC_DIR="$PLATFORM_DIR/openbmc"
    
    # Check if environment exists
    if [ ! -d "$PLATFORM_DIR" ] || [ ! -d "$OPENBMC_DIR" ]; then
        echo "Error: $CURRENT_PLATFORM environment not found. Please run option 2 first."
        echo ""
        echo "Press Enter to continue..."
        read
        return 1
    fi
    
    # Enter openbmc directory and execute menuconfig
    if cd "$OPENBMC_DIR" 2>/dev/null; then
        echo "Running devtool menuconfig linux-aspeed for $CURRENT_PLATFORM..."
        echo ""
        
        if [ "$CURRENT_PLATFORM" = "AST2600_qemu" ]; then
            SETUP_ARGS="ast2600-default as26_build"
        else
            SETUP_ARGS="ast2700-default as27_build"
        fi
        
        # Setup environment
        . setup $SETUP_ARGS
        
        # Run menuconfig
        devtool menuconfig linux-aspeed
        
        # Return to original directory
        cd "$ORIGINAL_DIR" || return
        echo ""
        echo "Menuconfig completed!"
    else
        echo "Error: Cannot access $OPENBMC_DIR directory."
        cd "$ORIGINAL_DIR" || return
    fi
    
    echo ""
    echo "Press Enter to continue..."
    read
}

# Main program loop
while true; do
    show_menu
    read choice
    
    case $choice in
        1)
            openbmc_change_platform
            ;;
        2)
            openbmc_clone_and_download
            ;;
        3)
            openbmc_download_image
            ;;
        4)
            openbmc_build_image
            ;;
        5)
            qemu_setup
            ;;
        6)
            qemu_run
            ;;
        7)
            linux_menuconfig
            ;;
        q|Q)
            echo ""
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            sleep 2
            ;;
    esac
done

