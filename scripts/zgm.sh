#!/bin/sh

BASE_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
SCRIPTS_DIR="$BASE_DIR/scripts"
PROFILES_DIR="$BASE_DIR/profiles"
STATE_DIR="$BASE_DIR/state"
LISTS_DIR="$BASE_DIR/lists"

. "$SCRIPTS_DIR/lib_ui.sh"
. "$SCRIPTS_DIR/lib_profiles.sh"
. "$SCRIPTS_DIR/lib_state.sh"
. "$SCRIPTS_DIR/lib_log.sh"
. "$SCRIPTS_DIR/lib_targets.sh"
. "$SCRIPTS_DIR/lib_checks.sh"

main_menu() {
    while true; do
        ui_header "zapret-gateway-manager"
        echo "1) Показать профили"
        echo "2) Выбрать профиль"
        echo "3) Запустить standard checks"
        echo "4) Показать текущее состояние"
        echo "5) Показать последние записи лога"
        echo "6) Выход"
        echo
        printf "Выбери пункт: "
        read -r choice

        case "$choice" in
            1)
                ui_header "Доступные профили"
                show_profiles
                ui_pause
                ;;
            2)
                select_profile_flow
                ;;
            3)
                run_standard_checks_flow
                ;;
            4)
                ui_header "Текущее состояние"
                show_state
                ui_pause
                ;;
            5)
                ui_header "Последние записи лога"
                show_last_logs 20
                ui_pause
                ;;
            6)
                log_info "Программа завершена пользователем"
                echo "Выход."
                exit 0
                ;;
            *)
                ui_error "Неверный пункт меню"
                ui_pause
                ;;
        esac
    done
}

select_profile_flow() {
    ui_header "Выбор профиля"
    list_profiles_numbered
    echo
    printf "Введи номер профиля: "
    read -r profile_num

    profile_path="$(get_profile_by_number "$profile_num")"

    if [ -z "$profile_path" ]; then
        ui_error "Профиль не найден"
        log_error "Попытка выбрать несуществующий профиль: $profile_num"
        ui_pause
        return
    fi

    if ! load_profile "$profile_path"; then
        ui_error "Не удалось загрузить профиль"
        log_error "Не удалось загрузить профиль: $profile_path"
        ui_pause
        return
    fi

    save_active_profile "$profile_path"

    log_info "Выбран профиль: $NAME ($profile_path)"
    ui_success "Профиль сохранён как активный"
    echo
    echo "Имя:        $NAME"
    echo "Описание:   $DESCRIPTION"
    echo "Backend:    $BACKEND"
    echo "Аргументы:  $NFQWS_ARGS"
    echo "Check set:  $CHECK_SET"
    echo "Priority:   $PRIORITY"
    echo
    echo "Реальное применение backend-логики будет добавлено следующим этапом."
    ui_pause
}

run_standard_checks_flow() {
    ui_header "Standard checks"

    if active_path="$(get_active_profile_path 2>/dev/null)"; then
        if ! load_profile "$active_path"; then
            ui_error "Активный профиль найден, но не загрузился"
            log_error "Checks: не удалось загрузить активный профиль: $active_path"
            ui_pause
            return
        fi
    else
        ui_error "Сначала выбери профиль"
        log_error "Checks запущены без активного профиля"
        ui_pause
        return
    fi

    ui_info "Активный профиль: $NAME"
    ui_info "Backend: $BACKEND"
    echo

    run_standard_checks
    ui_pause
}

bootstrap() {
    ensure_state_dir
    ensure_log_file
}

bootstrap
main_menu