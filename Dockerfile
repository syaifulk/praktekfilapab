# Laravel base image
FROM php:8.2-fpm

# Install dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev libzip-dev zip unzip git curl libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl pdo pdo_mysql gd zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set workdir
WORKDIR /var/www/html

# Copy seluruh project ke dalam image
COPY . .

# Expose port
EXPOSE 9000

# ✅ CMD: install dependency + migrate + storage link + jalankan php-fpm
CMD bash -c "composer install --no-interaction --prefer-dist --ignore-platform-reqs && php artisan migrate --force && php artisan storage:link && php-fpm"
