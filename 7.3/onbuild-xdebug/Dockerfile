FROM ozconseil/php:7.3-apache-xdebug
MAINTAINER ozconseil <dev@ozconseil.com>

COPY apache2-foreground /usr/local/bin/

# Install some packages
RUN apt-get update && apt-get install -y \
    build-essential \
    debian-archive-keyring \
    git \
    gnupg2 \
    default-mysql-client \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js
RUN cd /tmp && curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*
RUN npm install npm -g

# Install Composer
RUN curl -sS https://getcomposer.org/installer \
    | php -- --install-dir=/usr/local/bin --filename=composer \
    && mkdir -p /var/www/composer-cache \
    && chmod 777 /var/www/composer-cache \
    && composer config -g cache-dir /var/www/composer-cache

# Set the working directory
WORKDIR /var/www

# Copy project files, including (if exist) :
# - package.json and package-lock.json for npm deps installation
# - composer.json and composer.lock for composer deps installation
# - app.json for Dokku deployment
# - auth.json for Github deployment
# (these files should be at the root of the project)
ONBUILD COPY . /var/www/

# Install npm deps
ONBUILD RUN npm install --unsafe-perm

# Install composer deps
ONBUILD RUN composer install --prefer-dist --no-progress --no-dev -o
