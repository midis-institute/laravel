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

Для запуска проекта на Laravel и автоматического развертывания базы данных необходимо воспользоваться утилитой (файл в корневой директории) `./run.sh`, используя терминал Git Bash.

### <a name='project-run-docker-compose'></a>Запуск проекта в docker compose с помощью ./run.sh

Для запуска проекта в docker-compose через `./run.sh`, откройте терминал Git Bash в директории проекта и выполните команду:

```sh
# Чтобы вставить в GitBash - Shift + Insert
./run.sh
```

Данная команда выполняет автоматическую настройку `.env` файла (сделает копию `.env.example` и переименует в `.env`, установит `APP_KEY`, если его нет), устанавливает зависимости для `Laravel` и все `npm` зависимости, а также запускает проект и базу данных в docker'e, выполняет миграцию.

### Запуск проекта локально с помощью ./run.sh --local

Для запуска проекта и базы данных локально (не в docker-контейнерах), используйте команду:

```sh
./run.sh  --local
```

### Запуск проекта без утилиты ./run.sh, напрямую с помощью docker compose

Используйте эти команды, когда хотите запустить проект в docker-compose, или в случае, когда у вас не работает composer/npm/php

Все файлы базы данных будут храниться в папке `db_data` в корне проекта. Чтобы очистить БД, можно просто удалить эту папку.

- Запуск проекта Laravel в связке с автоматически развертываемой базой данных MySQL:

```sh
docker compose up -d
```

- Остановка проекта Laravel без остановки базы данных:

```sh
docker compose down laravel
```

При любом изменении файлов необходимо пересобирать Laravel-проект и запускать его заново:
```sh
docker compose down laravel
docker compose build laravel
docker compose up -d

```

## Публикация проекта на удаленный хост

Для публикации проекта на удаленном хосте, необходимо скопировать файлы проекта с вашего компьютера на сервер.

### Подключение к удаленному хосту и работа с файловой системой сервера

Для подключения к удаленному хосту, используйте команду:

```sh
ssh <имя_пользователя>@<удаленный_хост>
```

- имя_пользователя - имя подключающегося к удаленному хосту пользователя. По стандарту - `root`.

- удаленный_хост - ip-адрес сервера, на который вы хотите подключиться.

### <a name='file-system-navigation'></a> Переход по папкам, просмотр и удаление файлов

Для перехода по папкам, используйте команду:

```sh
cd <путь_к_папке>
```

- путь_к_папке - путь до директории, в которую необходимо перейти. Например, `/usr/src`.

Для того, чтобы определить текущую директорию, обратите внимание на командную строку:

```sh
# слева, после пользователя и хоста указана текущая директория
[root@127.0.0.1 /usr/src]$ 
```

Для того, чтобы узнать полный путь до текущей директории, используйте команду:

```sh
pwd
```

Для просмотра списка файлов в текущей директории, используйте команду:

```sh
ls -a
```

Для удаления файлов, используйте следующую команду:

```sh
# удаление всех файлов из папки
rm -rf /usr/src/ # /usr/src/ - это пример директории, в которой нужно удалить файлы. ВАЖНО! В данном случае, если не указать "/" после "src", будет удалена вся папка src, и её придется создавать заново.

# удаление конкретного файла
rm -rf .dockerignore
```

Для создания папки, используйте следующую команду:

```sh
mkdir /usr/src/ # эта команда создаст папку src/ в папке usr/
```

### Перенос файлов с локального компьютера на сервер

Прежде чем отправить файлы проекта на сервер, необходимо удалить папки `vendor`, `node_modules` и `db_data`, так как их перенос может затянуться на продолжительное количество времени, а папка `db_data` может нарушить работу базы данных на удаленном хосте.

В терминале Git Bash на локальной машине:

```sh
rm -rf vendor  # удаление папки vendor
rm -rf node_modules  # удаление папки node_modules
rm -rf db_data # удаление папки db_data 
```

После необходимо вызвать команду, которая отвечает за копирование файлов с локального компьютера и загрузку их на удаленный хост:

```sh
scp -r <путь_до_проекта> <имя_пользователя>@<удаленный_хост>:/usr/src
```

- `путь_до_проекта` - это путь до папки, в которой находится ваш Laravel-проект. Если терминал открыт внутри этой папки, можно указать `.`, вместо полного пути.

- `имя_пользователя` - имя подключающегося к удаленному хосту пользователя. По стандарту - `root`.

- `удаленный_хост` - ip-адрес сервера, на который будут перенесены файлы.

- `:/usr/src` - путь до папки, в которую будут перенесены все файлы.

После вам будет предложено ввести пароль от учетной записи.

**Внимание!** Если вы копируете файлы проекта не в первый раз, и? после переноса файлов вновь, в вашем проекте при запуске не обнаружились вносимые изменения, удалите содержимое папки на сервере и скопируйте файлы заново. Подробнее с командами можно ознакомиться в разделе [Переход по папкам, просмотр и удаление файлов](#file-system-navigation).

### Запуск проекта на сервере

Для запуска проекта на сервере, необходимо подключиться к удаленному хосту, куда были перенесены файлы и запустить проект посредством docker-compose.

Для подключения к удаленному хосту используйте команду:

```sh
ssh <имя_пользователя>@<удаленный_хост>
```

- имя_пользователя - имя подключающегося к удаленному хосту пользователя. По стандарту - `root`.

- удаленный_хост - ip-адрес сервера, на который вы хотите подключиться.

После ввода пароля от учетной записи, необходимо проследовать в папку с `docker-compose.yaml` файлом. Он располагается там же, куда были перенесены файлы проекта.

Для перехода по папкам, используйте команду:

```sh
cd <путь_к_папке>
```

- путь_к_папке - путь до директории, в которую необходимо перейти. Например, `/usr/src`.  

После перехода в директорию проекта, необходимо запустить проект через docker compose. Как это сделать рассказано в главе [Запуск проекта в docker compose с помощью ./run.sh](#project-run-docker-compose).

Если вам необходимо остановить проект на сервере, воспользуйтесь командой в папке с проектом на удаленном хосте (например, в папке `/usr/src/`, если переносили файлы туда):

```sh
docker compose down # команда остановит проект и удалит контейнеры
```
