#!/bin/bash
if [ ! -f .env ];
    then cp .env.example .env;
fi

if ! grep -q '^APP_KEY=' .env || [ -z "$(grep '^APP_KEY=' .env | cut -d '=' -f 2)" ];
    then php artisan key:generate;
fi
