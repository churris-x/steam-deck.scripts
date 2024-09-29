#!/bin/bash
# Written by Fran - 2024
# Installs all pacman binaries in use

echo "Installing pacman packages"
echo "Don't forget to sudo pacman-key --init and --populate"
echo

binaries=(
    # Build tools
    meson
    ninja
    cmake
    gcc
    clang

    # Utils
    bat
)

# Generate descriptions with:
# pacman -Qi ${binaries[@]} | grep -E "Name|Description" | sed 's/[^ ]* *//' | paste - -

echo "Installing binaries..."
sudo pacman -S ${binaries[@]}
