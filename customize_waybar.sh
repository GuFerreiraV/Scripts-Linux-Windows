#!/bin/bash

# Para manipular o JSON via Bash, instale o jq: sudo pacman -S jq
# O Arquivo de Configuração (~/.config/waybar/config ou config.jsonc)
# O Arquivo de Estilo (~/.config/waybar/style.css)

# Define os caminhos dos arquivos
WAYBAR_CONFIG="$HOME/.config/waybar/config.jsonc" # Confirmar se este e realmente o caminho
WAYBAR_STYLE="$HOME/.config/waybar/style.css"
BACKUP_CONFIG="$HOME/.config/waybar/config.backup_$(date+%F_%T)" # Caminho de backup
BACKUP_STYLE="$HOME/.config/waybar/style.backup_$(date+%F_%T)"

cp "$WAYBAR_CONFIG" "$BACKUP_CONFIG"
cp "$WAYBAR_STYLE" "$BACKUP_STYLE"
echo "Backup criado em: $BACKUP_CONFIG"

# Cenário imaginário: mover a posição da waybar, de top para bottom
# jq lê o arquivo, altera a chave '.position' para bottom
# salvamos o resultado em um arquivo temporário
# jq '.position = "bottom"' "$WAYBAR_CONFIG" > /tmp/waybar_temp.jsonc
# Heredoc: Permite despejar um bloco gigantesco de texto e gravá-lo em um arquivo.
cat << 'EOF' > "$WAYBAR_CONFIG"
{
    "layer": "top",
    "position": "top",
    "height": 34,
    "margin": "4 4 0 4", // Margem para dar um efeito legal
    
    "modules-left": [
        "wlr/taskbar"
    ],
    "modules-center": [
        "custom/arch"
    ],
    "modules-right": [
        "hyprland/language",
        "temperature",
        "custom/gpu",
        "pulseaudio",
        "network",
        "battery",
        "clock"
    ],

    // --- Configuração dos Módulos ---
    
    "wlr/taskbar": {
        "format": "{icon}",
        "icon-size": 18,
        "tooltip-format": "{title}", // Mostra o nome da janela ao passar o mouse
        "on-click": "activate",
        "on-click-middle": "close"
    },
    "custom/arch": {
        "format": "  ", // Ícone do Arch Linux (Requer fonte NerdFont como a FiraCode Nerd Font)
        "tooltip": false
    },
    "clock": {
        "format": "{:%H:%M}",
        "tooltip-format": "{:%A, %d de %B de %Y}" // Dia, data e ano
    },
    "battery": {
        "states": {
            "warning": 30,
            "critical": 15
        },
        "format": "{icon} {capacity}%",
        "format-charging": " {capacity}%",
        "format-icons": ["", "", "", "", ""]
    },
    "network": {
        "format-wifi": " {essid}",
        "format-ethernet": "󰈀 {ipaddr}",
        "format-disconnected": "⚠ Desconectado",
        "tooltip-format": "{ifname} via {gwaddr}"
    },
    "pulseaudio": {
        "format": "{icon} {volume}%",
        "format-muted": "󰖁 Mudo",
        "format-icons": {
            "default": ["", "", ""]
        }
    },
    "hyprland/language": { // Se usar hyprland, se usar Sway mude para "sway/language"
        "format": " {}"
    },
    "temperature": {
        "critical-threshold": 80,
        "format": "{icon} {temperatureC}°C",
        "format-icons": ["", "", ""]
    },
    "custom/gpu": {
        // O Waybar não tem um módulo nativo global de GPU. 
        // Ele lê a saída de um script ou comando. Aqui vai um exemplo básico lendo um comando.
        "exec": "cat /sys/class/drm/card0/device/gpu_busy_percent 2>/dev/null",
        "interval": 2,
        "format": "󰢮 {}",
        "tooltip": false
    }
}
EOF
echo "Arquivo config.jsonc atualizado!"


# === GERANDO O ESTILO ===
cat << 'EOF' > "$WAYBAR_STYLE"
* {
    /* Define a fonte global. É ALTAMENTE recomendado ter uma Nerd Font instalada */
    font-family: "FiraCode Nerd Font", "Font Awesome 6 Free", sans-serif;
    font-size: 14px;
    font-weight: bold;
}
window#waybar {
    /* Cor cinza escura para a barra com um pouco de transparência e bordas arredondadas */
    background: rgba(43, 43, 43, 0.9);
    color: #ffffff;
    border-radius: 8px;
}
/* Espaçamento interno dos módulos */
#taskbar, #custom-arch, #language, #temperature, #custom-gpu, #pulseaudio, #network, #battery, #clock {
    padding: 0 10px;
    margin: 2px 4px;
    border-radius: 6px;
    background: rgba(255, 255, 255, 0.05); /* Fundo sutil para cada itemzinho */
}
/* Deixando o ícone do Arch com a cor clássica (azulzinho) */
#custom-arch {
    color: rgba(43, 43, 43, 0.15);
    font-size: 18px;
    padding: 0 15px;
}
/* Mudando a cor da bateria quando estiver baixa */
#battery.critical {
    background-color: #f53c3c;
    color: #ffffff;
}
#battery.warning {
    background-color: #ff9e3b;
    color: #ffffff;
}
EOF
echo "Arquivo style.css atualizado!"

# Recarrega a waybar
killall waybar

# Espera um segundo para garantir 
sleep 1

# Inicia de forma "desanexado" do terminal para o script poder finalizar.
waybar & disown

echo "waybar recarregado com sucesso!"