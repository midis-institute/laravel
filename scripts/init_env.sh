#!/bin/bash
cp .env.example .env;

if ! grep -q '^APP_KEY=' .env || [ -z "$(grep '^APP_KEY=' .env | cut -d '=' -f 2)" ];
    then php artisan key:generate;
fi
