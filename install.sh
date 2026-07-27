#!/bin/bash

# Installation Arch + Niri + Noctalia + Dotfiles

echo " Installation Niri + Noctalia + Dotfiles (at a Arch Minimal)"

# 1. Check for and install an AUR helper (yay) if it is not present.
if ! command -v yay &> /dev/null; then
    echo "[+] 'yay' not found. Installing..."
    sudo pacman -S --needed --noconfirm git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd -
    rm -rf /tmp/yay
fi

# 2. Install essential packages and dependencies listed in your dotfiles
echo "[+] Installing packages and dependencies..."
# - niri: Wayland compositor
# - noctalia: Desktop shell (bars, launcher, etc.)
# - ghostty, alacritty: Terminals mentioned in the configuration
# - zen-browser-bin, nautilus: Web browser and file manager
# - polkit-gnome: Authentication agent
# - playerctl, brightnessctl, wireplumber, pavucontrol: Media and system controls
# - wl-clipboard, cliphist: Clipboard

yay -S --needed --noconfirm \
    niri \
    noctalia-qs \
    polkit-gnome \
    playerctl \
    brightnessctl \
    wireplumber \
    pavucontrol \
    wl-clipboard \
    cliphist \
    nautilus \
    alacritty \
    ghostty \
    zen-browser-bin \
    python

# 3. Preparar diretórios para os dotfiles
echo "[+] Preparando diretórios do Niri e Noctalia..."
mkdir -p ~/.config/niri
mkdir -p ~/.config/noctalia

# 4. Extract and create configuration files using Python
echo "[+] Extracting configuration files from local dotfiles.md..."
python3 - << 'EOF'
import re
from pathlib import Path

# Read the local markdown
with open('dotfiles.md', 'r', encoding='utf-8') as f:
    content = f.read()

# Regular expression to locate files and code blocks
# Looks for: ## `~/.config/...` followed by the block ``` ... ```
pattern = re.compile(r'##\s*`([^`]+)`.*?```[a-z]*\n(.*?)```', re.DOTALL)

matches = pattern.findall(content)

if not matches:
    print("[-] No configuration files found in the markdown!")
else:
    for filepath, code in matches:
        # Expand "~" to the actual user directory (/home/user/...)
        full_path = Path(filepath).expanduser()

        # Create necessary directories (if they don't exist)
        full_path.parent.mkdir(parents=True, exist_ok=True)

        # Save the file with the code block content
        with open(full_path, 'w', encoding='utf-8') as f:
            f.write(code.strip() + '\n')
        print(f"  -> Generated: {full_path}")
EOF

echo "=================================================="
echo " Installation completed successfully!"
echo " Log out and select 'Niri' in your login manager,"
echo " or start directly from the TTY by running the command: niri-session"

# By DevFreitas
