FROM ozconseil/php:5.4-apache
MAINTAINER ozconseil <team-dev@ozconseil.com>

COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
RUN pecl install xdebug-2.4.1 && docker-php-ext-enable xdebug
