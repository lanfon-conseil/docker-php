FROM lanfonconseil/php:7.3-apache
MAINTAINER lanfon-conseil <contact@lanfon-conseil.com>

COPY apache2-foreground /usr/local/bin/

COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
RUN pecl install xdebug && docker-php-ext-enable xdebug
