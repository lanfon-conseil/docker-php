FROM ozconseil/php:5.4-apache
MAINTAINER ozconseil <team-dev@ozconseil.com>

# Install Nodejs, Git, ssh & mysql clients
RUN cd /tmp && curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get update && apt-get install -y \
   git \
   openssh-client \
   mysql-client \
   nodejs \
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
