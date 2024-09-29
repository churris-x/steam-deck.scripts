#!/bin/bash
# Written by Fran - 2024
# Installs all pacman binaries in use

echo "Installing pacman packages"
echo "Don't forget to sudo pacman-key --init and --populate"
echo

binaries=(
    # Build tools
    meson                       # High productivity build system
    ninja                       # Small build system with a focus on speed
    cmake                       # A cross-platform open-source make syste
    gcc                         # The GNU Compiler Collection - C and C++ frontends
    clang                       # C language family frontend for LLVM

    # Utils
    bat                         # Cat clone with syntax highlighting and git integration
)

# Generate descriptions with:
# pacman -Qi ${binaries[@]} | grep -E "Name|Description" | sed 's/[^ ]* *//' | paste - -

echo "Installing binaries..."
sudo pacman -S ${binaries[@]}
