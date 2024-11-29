#!/bin/bash
NO_DB=false
for arg in "$@"; do
    if [ "$arg" == "--no-db" ]; then
        NO_DB=true
        break
    fi
done

bash ./scripts/init_env.sh

if [ "$NO_DB" == false ]; then
    docker compose up db -d
fi

if ! composer install; then
    echo "У ТЕБЯ ВСЁ ОЧЕНЬ ПЛОХО! У тебя не установлен composer, а значит ты для разработки должен deploy конфигурацию и каждый раз при изменении файлов использовать docker compose! Открой README.md и там посмотри как развернуть у себя локально сервер с помощью docker (пункт ВЫГРУЗКА НА СЕРВЕР)."
    exit 1
fi

npm install
npm run build

sleep 10


if command -v php >/dev/null 2>&1; then
    php artisan migrate
else
    "D:/xampp/php/php" artisan migrate
fi
