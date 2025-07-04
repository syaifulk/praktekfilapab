FROM php:8.2-fpm

# Install dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev libzip-dev zip unzip git curl libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl pdo pdo_mysql gd zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory
WORKDIR /var/www/html

# Copy all files
COPY . .

# Install Laravel dependencies
RUN composer install --no-interaction --prefer-dist --ignore-platform-reqs

# Jalankan migrate, storage:link, dan php-fpm
CMD php artisan migrate --force && php artisan storage:link && php-fpm
