# Профили

Профиль — это обычный `.conf` файл с shell-переменными.

Базовая структура:

```sh
NAME="basic"
DESCRIPTION="Minimal starter profile"
NFQWS_ARGS="--dpi-desync=fake"
CHECK_SET="default"
PRIORITY="10"
```

Поля:
- `NAME` — короткое имя;
- `DESCRIPTION` — описание;
- `NFQWS_ARGS` — аргументы рабочего режима;
- `CHECK_SET` — какой набор проверок использовать;
- `PRIORITY` — условный приоритет профиля.
