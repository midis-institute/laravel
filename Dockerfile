FROM bitnami/laravel AS base

ARG server_port=9000

WORKDIR /app

COPY . /app

RUN npm install -g pnpm && pnpm install

RUN npm run dev&

RUN composer install

RUN mv .env.example .env && php artisan key:generate

ENTRYPOINT php artisan migrate && php artisan serve --host 0.0.0.0 --port=9000