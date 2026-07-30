#!/usr/bin/env bash

set -e

########################################
# Caelestia Schema Manager
# by Henrique Souza
########################################

if ! command -v gum >/dev/null 2>&1; then
    echo "gum não está instalado."
    echo
    echo "Arch Linux:"
    echo "  sudo pacman -S gum"
    echo
    echo "Ubuntu/Debian:"
    echo "  sudo snap install gum"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SCHEME_DIR=$(find /usr/lib -type d \
-path "*/site-packages/caelestia/data/schemes" \
2>/dev/null | head -n1)

if [[ -z "$SCHEME_DIR" ]]; then
    gum style \
        --foreground 196 \
        "Caelestia não encontrado."

    exit 1
fi

install_schema() {

    mapfile -t THEMES < <(
        find "$SCRIPT_DIR" -maxdepth 1 -mindepth 1 -type d \
        ! -name ".git" \
        ! -name ".github" \
        -printf "%f\n" | sort
    )

    [[ ${#THEMES[@]} -eq 0 ]] && {
        gum style --foreground 196 "Nenhum schema encontrado."
        return
    }

    THEME=$(printf "%s\n" "${THEMES[@]}" | gum choose)

    [[ -z "$THEME" ]] && return

    if gum confirm "Instalar \"$THEME\"?"; then

        sudo rm -rf "$SCHEME_DIR/$THEME"

        sudo cp -r \
            "$SCRIPT_DIR/$THEME" \
            "$SCHEME_DIR/"

        gum style \
            --foreground 46 \
            "✓ $THEME instalado!"
    fi
}

remove_schema() {

    mapfile -t THEMES < <(
        find "$SCHEME_DIR" -maxdepth 1 -mindepth 1 -type d \
        -printf "%f\n" | sort
    )

    [[ ${#THEMES[@]} -eq 0 ]] && return

    THEME=$(printf "%s\n" "${THEMES[@]}" | gum choose)

    [[ -z "$THEME" ]] && return

    if gum confirm "Remover \"$THEME\"?"; then

        sudo rm -rf "$SCHEME_DIR/$THEME"

        gum style \
            --foreground 46 \
            "✓ Removido."
    fi
}

list_installed() {

    gum style \
        --border rounded \
        --padding "1 2" \
        "Schemas instalados"

    find "$SCHEME_DIR" \
        -maxdepth 1 \
        -mindepth 1 \
        -type d \
        -printf "• %f\n"

    echo

    read -p "Pressione ENTER..."
}

about() {

gum style \
--border rounded \
--padding "1 2" \
"Caelestia Schema Manager

Versão 1.0

Instale qualquer schema do Caelestia
com apenas alguns cliques.

Criado por Henrique Souza"

read -p "Pressione ENTER..."
}

while true
do

clear

gum style \
--border double \
--align center \
--foreground 99 \
--padding "1 4" \
"🎨 Caelestia Schema Manager"

OPTION=$(
printf "%s\n" \
"Install Schema" \
"Remove Schema" \
"List Installed" \
"About" \
"Exit" |
gum choose
)

case "$OPTION" in

"Install Schema")
install_schema
;;

"Remove Schema")
remove_schema
;;

"List Installed")
list_installed
;;

"About")
about
;;

"Exit")
exit
;;

esac

done
