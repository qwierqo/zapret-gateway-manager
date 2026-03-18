#!/bin/sh

ui_header() {
    title="$1"
    clear 2>/dev/null
    echo "========================================"
    echo "$title"
    echo "========================================"
    echo
}

ui_info() {
    echo "[INFO] $1"
}

ui_error() {
    echo "[ERROR] $1"
}

ui_pause() {
    echo
    printf "Нажми Enter для продолжения..."
    read _dummy
}
