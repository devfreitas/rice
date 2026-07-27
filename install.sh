
#!/bin/bash

echo "=================================================="
echo " Instalador Niri + Noctalia + Dotfiles (Arch Minimal)"
echo "=================================================="

# 1. Verificar e instalar um AUR helper (yay) se não estiver presente
if ! command -v yay &> /dev/null; then
    echo "[+] 'yay' não encontrado. Instalando..."
    sudo pacman -S --needed --noconfirm git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd -
    rm -rf /tmp/yay
fi

# 2. Instalar pacotes essenciais e dependências citadas nos seus dotfiles
echo "[+] Instalando pacotes e dependências..."
# - niri: Compositor Wayland
# - noctalia: O desktop shell (barras, launcher, etc)
# - ghostty, alacritty: Terminais citados na configuração
# - zen-browser-bin, nautilus: Navegador e gerenciador de arquivos
# - polkit-gnome: Agente de autenticação
# - playerctl, brightnessctl, wireplumber, pavucontrol: Controles de mídia e sistema
# - wl-clipboard, cliphist: Área de transferência

yay -S --needed --noconfirm \
    niri \
    noctalia \
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

# 4. Baixar o arquivo markdown com os dotfiles
echo "[+] Baixando configurações do GitHub..."
curl -sL "https://raw.githubusercontent.com/devfreitas/rice/main/dotfiles.md" -o /tmp/dotfiles.md

# 5. Extrair e criar os arquivos de configuração usando Python
echo "[+] Extraindo os arquivos de configuração..."
python3 - << 'EOF'
import re
from pathlib import Path

# Lê o markdown baixado
with open('/tmp/dotfiles.md', 'r', encoding='utf-8') as f:
    content = f.read()

# Expressão regular para localizar arquivos e blocos de código
# Procura por: ## `~/.config/...` seguido do bloco ``` ... ```
pattern = re.compile(r'##\s*`([^`]+)`\s*\n+```[a-z]*\n(.*?)```', re.DOTALL)

matches = pattern.findall(content)

if not matches:
    print("[-] Nenhum arquivo de configuração encontrado no markdown!")
else:
    for filepath, code in matches:
        # Expande o "~" para o diretório real do usuário (/home/usuario/...)
        full_path = Path(filepath).expanduser()

        # Cria os diretórios necessários (se não existirem)
        full_path.parent.mkdir(parents=True, exist_ok=True)

        # Salva o arquivo com o conteúdo do bloco de código
        with open(full_path, 'w', encoding='utf-8') as f:
            f.write(code.strip() + '\n')
        print(f"  -> Gerado: {full_path}")
EOF

echo "=================================================="
echo " Instalação concluída com sucesso!"
echo " Faça logout e selecione o 'Niri' no seu gerenciador de login,"
echo " ou inicie diretamente pelo TTY executando o comando: niri-session"
echo "=================================================="
