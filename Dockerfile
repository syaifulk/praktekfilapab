FROM php:8.2-fpm

# Install dependencies
RUN apt-get update && apt-get install -y \
    git unzip curl libzip-dev zip \
    libpng-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-install pdo pdo_mysql zip gd

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set workdir ke root project
WORKDIR /var/www

# Salin hanya folder Laravel
COPY laravel/ ./laravel/

# Masuk ke dalam folder Laravel
WORKDIR /var/www/laravel

# Install dependency Laravel
RUN composer install --ignore-platform-reqs

EXPOSE 9000
CMD ["php-fpm"]
