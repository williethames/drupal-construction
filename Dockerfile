FROM drupal:latest

# Set working directory
WORKDIR /var/www/html

# Install additional PHP extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

# Set proper file permissions
RUN chown -R www-data:www-data /var/www/html

# Enable mod_rewrite (for clean URLs)
RUN a2enmod rewrite
