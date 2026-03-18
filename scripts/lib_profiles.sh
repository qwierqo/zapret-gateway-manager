#!/bin/sh

show_profiles() {
    for file in "$PROFILES_DIR"/*.conf; do
        [ -f "$file" ] || continue
        unset NAME DESCRIPTION NFQWS_ARGS CHECK_SET PRIORITY
        . "$file"
        echo "Имя: $NAME"
        echo "Описание: $DESCRIPTION"
        echo "Аргументы: $NFQWS_ARGS"
        echo "Файл: $file"
        echo "----------------------------------------"
    done
}

list_profiles_numbered() {
    i=1
    for file in "$PROFILES_DIR"/*.conf; do
        [ -f "$file" ] || continue
        unset NAME DESCRIPTION NFQWS_ARGS CHECK_SET PRIORITY
        . "$file"
        echo "$i) $NAME — $DESCRIPTION"
        i=$((i + 1))
    done
}

get_profile_by_number() {
    target="$1"
    i=1
    for file in "$PROFILES_DIR"/*.conf; do
        [ -f "$file" ] || continue
        if [ "$i" = "$target" ]; then
            echo "$file"
            return 0
        fi
        i=$((i + 1))
    done
    return 1
}

load_profile() {
    profile_file="$1"
    [ -f "$profile_file" ] || return 1
    unset NAME DESCRIPTION NFQWS_ARGS CHECK_SET PRIORITY
    . "$profile_file"
    return 0
}
