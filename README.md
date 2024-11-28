<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## About Laravel

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling. Laravel takes the pain out of development by easing common tasks used in many web projects, such as:

- [Simple, fast routing engine](https://laravel.com/docs/routing).
- [Powerful dependency injection container](https://laravel.com/docs/container).
- Multiple back-ends for [session](https://laravel.com/docs/session) and [cache](https://laravel.com/docs/cache) storage.
- Expressive, intuitive [database ORM](https://laravel.com/docs/eloquent).
- Database agnostic [schema migrations](https://laravel.com/docs/migrations).
- [Robust background job processing](https://laravel.com/docs/queues).
- [Real-time event broadcasting](https://laravel.com/docs/broadcasting).

Laravel is accessible, powerful, and provides tools required for large, robust applications.

## Learning Laravel

Laravel has the most extensive and thorough [documentation](https://laravel.com/docs) and video tutorial library of all modern web application frameworks, making it a breeze to get started with the framework.

You may also try the [Laravel Bootcamp](https://bootcamp.laravel.com), where you will be guided through building a modern Laravel application from scratch.

If you don't feel like reading, [Laracasts](https://laracasts.com) can help. Laracasts contains thousands of video tutorials on a range of topics including Laravel, modern PHP, unit testing, and JavaScript. Boost your skills by digging into our comprehensive video library.

## Запуск проекта
Для запуска проекта на Laravel и автоматического развертывания базы данных используйте следующие команды:

Открываете Git BASH в папке с проектом! И выполняете командe ->
```sh
# Чтобы вставить в GitBash - Shift + Insert
./preload.sh
```
Данная команда настроит `.env` файл (сделает копию `.env.example` и переименует в `.env`. Установит `APP_KEY`, если его нет). Запустит БД в Docker. Скачает все зависимости для Laravel, скачает все NPM зависимости и запустит миграцию.
Eсли не хотите запускать БД в Docker, и хотите использовать XAMPP, то выполните команду ->
```sh
./preload.sh --no-db
```


Все файлы базы данных будут храниться в папке `db_data` в корне проекта. Чтобы очистить БД, можно просто удалить эту папку.

Для запуска Laravel делаем всё как обычно -> 
```sh
php artisan serve
```
Или есть есть ошибка, что не найден php
```sh
"D:\xampp\php\php" artisan serve
```

И в другом терминале
```sh
npm run dev
```

## ВЫГРУЗКА НА СЕРВЕР
Используйте эти команды, когда вы хотите загрузить проект сервер. Или в случае, если у вас не работает composer/npm/php

Когда вы будите архивировать проект, не обязательно забудьте удалить папку `vendor`, `node_modules`, `db_data` и файл `.env`. База данных всё равно будет создана новая (из-за разности Windows и Linux), а `.env` бесполезен, т.к. бд будет создана снова.
Все файлы базы данных будут храниться в папке `db_data` в корне проекта. Чтобы очистить БД, можно просто удалить эту папку.
- Запуск проекта Laravel в связке с автоматически развертываемой базой данных MySQL:
```sh
docker compose up -d
```
- Остановка проекта Laravel без БД:
```sh
docker compose down laravel
```

При любом изменении файлов тебе нужено будет перезапускать сервер, то есть
```sh
docker compose down laravel
docker compose build laravel
docker compose up -d
```
