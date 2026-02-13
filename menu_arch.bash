#!/bin/bash

# Cores
VERDE='\u001b[32m'
AZULCLARO='\u001b[34;1m'
RESET='\033[0m'

# Função para exibir
menu() {
    clear
    echo -e "${AZULCLARO}===== MENU DE COMANDOS =====${RESET}\n"
    
    echo -e "${AZULCLARO}===== ATUALIZANDO =====${RESET}"
    echo "1)  sudo pacman -Syu           -> Atualiza o sistema (pacman)"
    echo "2)  yay -Syu                    -> Atualiza também pacotes do AUR (se usar yay)"
    
    echo -e "\n${AZULCLARO}===== INSTALANDO =====${RESET}"
    echo "3)  sudo pacman -S <pacote>     -> Instala um pacote (exemplo: sudo pacman -S firefox)"
    echo "4)  yay -S <pacote>              -> Instala pacote do AUR (exemplo: yay -S google-chrome)"

    echo -e "\n${AZULCLARO}===== SYSTEMD: GERENCIANDO SERVIÇOS =====${RESET}"
    echo "5)  sudo systemctl start <serviço> -> Inicia um serviço (ex.: NetworkManager)"
    echo "6)  sudo systemctl enable <serviço>  -> Ativa serviço na inicialização"
    echo "7)  sudo systemctl status <serviço>  -> Ver status de um serviço"
    
    echo "8)  ip a                        -> Mostra interfaces de rede e IPs"
    echo "9)  iwctl                        -> Entra no interativo do iwd (para Wi-Fi)"
    echo "10) nmtui                        -> Interface textual do NetworkManager"
    echo "11) sudo wifi-menu               -> (se usar netctl) Configura Wi-Fi"
    echo "12) waybar                       -> Inicia a waybar (se já configurada)"

    echo -e "\n${AZULCLARO}===== REMOVENDO PACOTES =====${RESET}"
    echo "13) sudo pacman -R <pacote>      -> Remove um pacote"
    echo "14) sudo pacman -Rs <pacote>     -> Remove um pacote e suas dependências não necessárias"
    echo "15) sudo pacman -Rsc <pacote>    -> Remove um pacote, as dependências não necessárias e configuração de arquivos associados ao pacote. Toma cuida carai"
    
    echo -e "\n${AZULCLARO}===== CONSULTANDO INFORMAÇÕES DE PACOTES =====${RESET}"
    echo "16) sudo pacman -Q <pacote> -> Checa se um pacote está instalado"
    echo "17) sudo pacman -Qi <pacote> -> Mostra informações detalhadas sobre um pacote instalado (versao, dependencias e tamanho)"
    echo "18) sudo pacman -Ql <pacote> -> Lista todos arquivos instalados de um pacote"
    
    echo -e "\n${AZULCLARO}===== LIMPANDO O CACHE DE PACOTE =====${RESET}"
    echo "19) sudo pacman -Sc -> Remove pacote não instalados do cache"
    echo "20) sudo pacman -Scc -> Remove todos os pacotes do cache, incluindo pacotes instalados recentemente. Toma cuidado carai"
    
    echo -e "\n21) Sair"
    echo -e "${VERDE}Digite o número da opção desejada:${RESET} "
}

while true; do
    menu
    read -r opcao
    case $opcao in
        1)
            sudo pacman -Syu
            read -p "Pressione Enter para continuar..."
            ;;
        2)
            yay -Syu
            read -p "Pressione Enter para continuar..."
            ;;
        3)
            echo "Digite o nome do pacote:"
            read -r pacote
            sudo pacman -S "$pacote"
            read -p "Pressione Enter para continuar..."
            ;;
        4)
            echo "Digite o nome do pacote AUR:"
            read -r pacote
            yay -S "$pacote"
            read -p "Pressione Enter para continuar..."
            ;;
        5)
            echo "Digite o nome do serviço:"
            read -r servico
            sudo systemctl start "$servico"
            read -p "Pressione Enter para continuar..."
            ;;
        6)
            echo "Digite o nome do serviço:"
            read -r servico
            sudo systemctl enable "$servico"
            read -p "Pressione Enter para continuar..."
            ;;
        7)
            echo "Digite o nome do serviço:"
            read -r servico
            sudo systemctl status "$servico"
            read -p "Pressione Enter para continuar..."
            ;;
        8)
            ip a
            read -p "Pressione Enter para continuar..."
            ;;
        9)
            iwctl
            read -p "Pressione Enter para continuar..."
            ;;
        10)
            nmtui
            read -p "Pressione Enter para continuar..."
            ;;
        11)
            sudo wifi-menu
            read -p "Pressione Enter para continuar..."
            ;;
        12)
            waybar
            read -p "Pressione Enter para continuar..."
            ;;
        13)
            echo "Digite o nome do pacote:"
            read -r pacote
            sudo pacman -R "$pacote"
            read -p "Pressione Enter para continuar..."
            ;;
        14)
            echo "Digite o nome do pacote:"
            read -r pacote
            sudo pacman -Rs "$pacote"
            read -p "Pressione Enter para continuar..."
            ;;
        15)
            echo "Digite o nome do pacote:"
            read -r pacote
            sudo pacman -Rsc "$pacote"
            read -p "Pressione Enter para continuar..."
            ;;
        16)
            echo "Digite o nome do pacote:"
            read -r pacote
            sudo pacman -Q "$pacote"
            read -p "Pressione Enter para continuar..."
            ;;
        17)
            echo "Digite o nome do pacote:"
            read -r pacote
            sudo pacman -Qi "$pacote"
            read -p "Pressione Enter para continuar..."
            ;;
        18)
            echo "Digite o nome do pacote:"
            read -r pacote
            sudo pacman -Ql "$pacote"
            read -p "Pressione Enter para continuar..."
            ;;
        19)
            echo "Digite o nome do pacote:"
            read -r pacote
            sudo pacman -Sc "$pacote"
            read -p "Pressione Enter para continuar..."
            ;;
        20)
            echo "Digite o nome do pacote:"
            read -r pacote
            sudo pacman -Scc "$pacote"
            read -p "Pressione Enter para continuar..."
            ;;            
        21)
            echo "Saindo..."
            exit 0
            ;;
        *)
            echo "Opção inválida!"
            read -p "Pressione Enter para tentar novamente..."
            ;;
    esac
done