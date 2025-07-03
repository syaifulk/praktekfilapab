FROM php:8.2-fpm

# Install extensions and dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    unzip \
    git \
    curl \
    libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl pdo pdo_mysql gd zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory ke folder laravel (bukan root!)
WORKDIR /var/www/html

# Salin hanya isi folder laravel ke dalam container
COPY laravel/ ./

# Jalankan composer install
RUN composer install --ignore-platform-reqs --no-interaction --prefer-dist

# (Opsional) Set permission jika perlu
# RUN chown -R www-data:www-data storage bootstrap/cache

EXPOSE 9000

CMD ["php-fpm"]
