FROM php:8.2-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev libzip-dev \
    zip unzip git curl libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl pdo pdo_mysql gd zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Working directory
WORKDIR /var/www/html

# Copy project files
COPY . .

# Expose port
EXPOSE 9000

# ✅ FINAL: Jalankan composer install, lalu php artisan, lalu php-fpm
CMD bash -c "composer install --no-interaction --prefer-dist --ignore-platform-reqs && php artisan migrate --force && php artisan storage:link && php-fpm"
