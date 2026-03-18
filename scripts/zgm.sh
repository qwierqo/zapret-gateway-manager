#!/bin/sh

BASE_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
SCRIPTS_DIR="$BASE_DIR/scripts"
PROFILES_DIR="$BASE_DIR/profiles"
STATE_DIR="$BASE_DIR/state"

. "$SCRIPTS_DIR/lib_ui.sh"
. "$SCRIPTS_DIR/lib_profiles.sh"
. "$SCRIPTS_DIR/lib_state.sh"

ensure_state_dir() {
    [ -d "$STATE_DIR" ] || mkdir -p "$STATE_DIR"
}

manual_mode() {
    ui_header "Ручной режим"
    list_profiles_numbered
    echo
    printf "Выбери номер профиля: "
    read profile_num

    profile_path="$(get_profile_by_number "$profile_num")"

    if [ -z "$profile_path" ]; then
        ui_error "Профиль не найден."
        ui_pause
        return
    fi

    if load_profile "$profile_path"; then
        ui_info "Выбран профиль: $NAME"
        ui_info "Описание: $DESCRIPTION"
        ui_info "Аргументы: $NFQWS_ARGS"
        save_last_selected_profile "$profile_path"
        ui_info "Пока профиль только сохранён в state."
    else
        ui_error "Не удалось загрузить профиль."
    fi

    ui_pause
}

main_menu() {
    while true; do
        ui_header "zapret-gateway-manager"
        echo "1) Автонастройка (заглушка)"
        echo "2) Ручной режим"
        echo "3) Показать профили"
        echo "4) Показать состояние"
        echo "5) Выход"
        echo
        printf "Выбери пункт: "
        read choice

        case "$choice" in
            1)
                ui_info "Автонастройка будет добавлена позже."
                ui_pause
                ;;
            2)
                manual_mode
                ;;
            3)
                show_profiles
                ui_pause
                ;;
            4)
                show_state
                ui_pause
                ;;
            5)
                exit 0
                ;;
            *)
                ui_error "Неверный пункт меню."
                ui_pause
                ;;
        esac
    done
}

ensure_state_dir
main_menu
