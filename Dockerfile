FROM php:8.2-apache

# Enable Apache rewrite (optional but common)
RUN a2enmod rewrite

# Install mysqli + pdo_mysql (needed for MySQL)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy your project into Apache's web root
COPY . /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html
