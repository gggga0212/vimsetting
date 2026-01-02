#!/bin/bash

# Default platform
CURRENT_PLATFORM="AST2600_qemu"

# Show menu
show_menu() {
    clear
    echo "=========================================="
    echo "      OpenBMC Setup Script"
    echo "=========================================="
    echo ""
    echo "Current Platform: $CURRENT_PLATFORM"
    echo ""
    echo "1: change OpenBmc version"
    if [ "$CURRENT_PLATFORM" = "AST2600_qemu" ]; then
        echo "   AST2600_qemu (v)"
        echo "   AST2700_qemu"
    else
        echo "   AST2600_qemu"
        echo "   AST2700_qemu (v)"
    fi
    echo "2: Clone and set env."
    echo "3: Download image."
    echo "4: Build image."
    echo "q: Quit."
    echo ""
    echo -n "Please select an option: "
}

# Change platform
change_platform() {
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
clone_and_set_env() {
    clear
    echo "=========================================="
    echo "      Clone and Set Environment"
    echo "=========================================="
    echo "Platform: $CURRENT_PLATFORM"
    echo ""
    
    echo "Setting up $CURRENT_PLATFORM..."
    
    # Set platform-specific parameters
    if [ "$CURRENT_PLATFORM" = "AST2600_qemu" ]; then
        PLATFORM_DIR="AST2600_qemu"
        SETUP_ARGS="ast2600-default as26_build"
    else
        PLATFORM_DIR="AST2700_qemu"
        SETUP_ARGS="ast2700-default as27_build"
    fi
    
    # Create platform directory
    mkdir -p "$PLATFORM_DIR"
    cd "$PLATFORM_DIR" || exit
    
    # Determine clone location based on platform
    if [ "$CURRENT_PLATFORM" = "AST2600_qemu" ]; then
        cd ~ || exit
    fi
    
    # Clone repository
    if [ "$CURRENT_PLATFORM" = "AST2600_qemu" ]; then
        git clone https://github.com/AspeedTech-BMC/openbmc.git
    else
        git clone -b v09.06 https://github.com/AspeedTech-BMC/openbmc.git
    fi
    cd openbmc || exit
    
    # Setup environment
    . setup $SETUP_ARGS
    
    # Install dependencies (shared by both platforms)
    sudo apt update
    sudo apt install -y git gcc g++ make file wget gawk diffstat bzip2 cpio chrpath zstd lz4 bzip2
    sudo locale-gen en_US.UTF-8
    
    echo ""
    echo "$CURRENT_PLATFORM environment setup completed!"
    echo ""
    echo "Press Enter to continue..."
    read
}

# Download image
download_image() {
    clear
    echo "=========================================="
    echo "      Download Image"
    echo "=========================================="
    echo "Platform: $CURRENT_PLATFORM"
    echo ""
    
    # Set directory path based on current platform
    PLATFORM_DIR="$CURRENT_PLATFORM"
    OPENBMC_DIR="$PLATFORM_DIR/openbmc"
    
    # Check if environment exists
    if [ ! -d "$PLATFORM_DIR" ] || [ ! -d "$OPENBMC_DIR" ]; then
        echo "Error: $CURRENT_PLATFORM environment not found. Please run option 2 first."
        echo ""
        echo "Press Enter to continue..."
        read
        return 1
    fi
    
    # Save current directory
    ORIGINAL_DIR=$(pwd)
    
    # Enter openbmc directory and execute download
    if cd "$OPENBMC_DIR" 2>/dev/null; then
        echo "Downloading image for $CURRENT_PLATFORM..."
        bitbake obmc-phosphor-image --runall=fetch
        echo ""
        echo "Download completed!"
        # Return to original directory
        cd "$ORIGINAL_DIR" || return
    else
        echo "Error: Cannot access $OPENBMC_DIR directory."
        cd "$ORIGINAL_DIR" || return
    fi
    
    echo ""
    echo "Press Enter to continue..."
    read
}

# Build image
build_image() {
    clear
    echo "=========================================="
    echo "      Build Image"
    echo "=========================================="
    echo "Platform: $CURRENT_PLATFORM"
    echo ""
    
    if [ "$CURRENT_PLATFORM" = "AST2600_qemu" ]; then
        if [ -d "AST2600_qemu" ] && [ -d "AST2600_qemu/openbmc" ]; then
            cd AST2600_qemu/openbmc || exit
            echo "Building image for AST2600_qemu..."
            bitbake obmc-phosphor-image
            echo ""
            echo "Build completed!"
        else
            echo "Error: AST2600_qemu environment not found. Please run option 2 first."
        fi
    else
        if [ -d "AST2700_qemu" ] && [ -d "AST2700_qemu/openbmc" ]; then
            cd AST2700_qemu/openbmc || exit
            echo "Building image for AST2700_qemu..."
            bitbake obmc-phosphor-image
            echo ""
            echo "Build completed!"
        else
            echo "Error: AST2700_qemu environment not found. Please run option 2 first."
        fi
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
            change_platform
            ;;
        2)
            clone_and_set_env
            ;;
        3)
            download_image
            ;;
        4)
            build_image
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

