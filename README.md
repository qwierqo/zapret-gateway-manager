# zapret-gateway-manager

Lightweight Linux gateway manager for whole-network traffic processing with zapret.

> Небольшая shell-обвязка вокруг `zapret` для Linux-шлюза между интернетом и домашней сетью.
> Цель проекта — упростить профили, проверки, логирование и постепенную автоматизацию настройки.

## Идея проекта

Проект не заменяет `zapret`.
Он выступает как отдельный слой управления поверх уже установленного `zapret`:

- хранит и переключает профили;
- запускает проверки доступности сервисов;
- сохраняет последнее рабочее состояние;
- в будущем сможет автоматически подбирать профиль.

## Для чего это нужно

- как домашняя полезная штука;
- как учебный проект по Linux, сетям и shell scripting;
- как GitHub-портфолио по инфраструктурной автоматизации.

## Текущий статус

Ранняя заготовка репозитория.

Реализовано:
- структура проекта;
- базовые профили;
- каркас shell-скрипта;
- документация и дорожная карта.

Планируется:
- ручное применение профиля;
- health-check для сервисов;
- сохранение состояния;
- автоподбор профиля;
- установочный сценарий.

## Предполагаемая архитектура

- `scripts/` — shell-логика проекта;
- `profiles/` — набор профилей и их параметров;
- `lists/` — тестовые и исключающие списки;
- `state/` — временные файлы и состояние;
- `docs/` — документация и архитектурные заметки.

## Зависимости

Проект рассчитан на Linux-шлюз и работу поверх установленного `zapret`.

## Быстрый старт

Пока доступен только каркас:

```bash
chmod +x scripts/zgm.sh
./scripts/zgm.sh
```

## Дорожная карта

Смотри `docs/roadmap.md`.

## Credits

Проект вдохновлён и ориентирован на работу поверх:
- `bol-van/zapret`

Ссылка на upstream:
- https://github.com/bol-van/zapret

## License

Собственный код этого репозитория распространяется под лицензией MIT.
Смотри `LICENSE` и `NOTICE.md`.

## Status

Project is currently in early scaffold stage.

The initial focus is:
- Linux gateway mode
- manual profile handling
- state storage
- service health checks
- future autotuning

## Roadmap

### v0.1.0
- repository scaffold
- manual profile selection
- state storage

### v0.2.0
- basic service health checks
- logging improvements

### v0.3.0
- automatic profile comparison
- profile scoring
- best-profile persistence
