FROM node:22 AS frontend

WORKDIR /app

COPY package*.json ./
 
RUN npm install -g pnpm && pnpm install 

COPY . /app

RUN npm run build

FROM bitnami/laravel AS base

WORKDIR /app

RUN apt-get update && apt-get install -y unzip git && rm -rf /var/lib/apt/lists/*

COPY . /app

COPY --from=frontend /app/public /app/public

RUN composer install --no-dev --optimize-autoloader

RUN bash ./scripts/init_env.sh

ENTRYPOINT ["sh", "-c", "php artisan route:cache \
    && php artisan view:cache \
    && php artisan event:cache \
    && php artisan optimize \
    && php artisan migrate \
    && php artisan serve --host=0.0.0.0 --port=${APP_PORT:-9000}"]
