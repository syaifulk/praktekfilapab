FROM php:8.2-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git unzip curl libzip-dev zip \
    libpng-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-install pdo pdo_mysql zip gd

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set workdir ke /var/www
WORKDIR /var/www

# Salin folder Laravel ke dalam container
COPY laravel/ ./

# Jalankan composer install di dalam /var/www
RUN composer install --ignore-platform-reqs --no-interaction --prefer-dist

EXPOSE 9000

CMD ["php-fpm"]
