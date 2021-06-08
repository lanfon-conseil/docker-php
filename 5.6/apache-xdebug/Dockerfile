FROM lanfonconseil/php:5.6-apache
MAINTAINER lanfon-conseil <contact@lanfon-conseil.com>

COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
RUN pecl install xdebug-2.5.5 && docker-php-ext-enable xdebug
