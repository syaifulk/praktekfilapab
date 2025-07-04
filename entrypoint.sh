#!/bin/sh

echo "📦 Running composer install..."
composer install --no-interaction --prefer-dist --ignore-platform-reqs

echo "⚙️  Running artisan commands..."
php artisan migrate --force || true
php artisan storage:link || true

echo "🚀 Starting PHP-FPM..."
exec php-fpm
