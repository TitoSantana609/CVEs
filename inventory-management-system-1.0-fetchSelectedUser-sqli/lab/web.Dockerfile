FROM php:8.2-apache

# The app uses the mysqli OO API; it isn't bundled in the base image.
RUN docker-php-ext-install mysqli \
    && a2enmod rewrite

# Quieter logs; the app triggers notices (undefined session keys) that are harmless here.
RUN { echo "display_errors = Off"; echo "error_reporting = E_ALL & ~E_NOTICE & ~E_WARNING & ~E_DEPRECATED"; } \
    > /usr/local/etc/php/conf.d/zz-lab.ini

# App is bind-mounted at /var/www/html by docker-compose, so nothing to COPY.
