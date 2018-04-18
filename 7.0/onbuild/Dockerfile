FROM ozconseil/php:7.0-apache
MAINTAINER ozconseil <dev@ozconseil.com>

COPY apache2-foreground /usr/local/bin/

# Install some packages
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    gnupg2 \
    mysql-client \
    openssh-client

# Install Node
RUN cd /tmp && curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*
RUN npm install yarn -g

# Install Composer
RUN curl -sS https://getcomposer.org/installer \
    | php -- --install-dir=/usr/local/bin --filename=composer \
    && mkdir -p /var/www/composer-cache \
    && chmod 777 /var/www/composer-cache \
    && composer config -g cache-dir /var/www/composer-cache

WORKDIR /var/www

# npm deps
ONBUILD COPY package.json /var/www/
ONBUILD RUN yarn

# Composer deps
ONBUILD COPY auth.json /var/www/
ONBUILD COPY composer.json /var/www/
ONBUILD COPY composer.lock /var/www/
ONBUILD RUN composer install --prefer-dist --no-progress --no-dev -o

# custom code
ONBUILD COPY . /var/www/
