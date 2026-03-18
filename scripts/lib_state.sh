#!/bin/sh

LAST_PROFILE_FILE="$STATE_DIR/last_profile.state"

save_last_selected_profile() {
    profile_path="$1"
    echo "$profile_path" > "$LAST_PROFILE_FILE"
}

show_state() {
    if [ -f "$LAST_PROFILE_FILE" ]; then
        echo "Последний выбранный профиль:"
        cat "$LAST_PROFILE_FILE"
    else
        echo "Состояние пока не сохранено."
    fi
}
