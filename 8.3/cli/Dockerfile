FROM php:8.3.0-cli
MAINTAINER lanfon-conseil <contact@lanfon-conseil.com>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive && apt-get install -y \
    curl \
    g++ \
    git \
    imagemagick \
    libbz2-dev \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libwebp-dev \
    libpng-dev \
    libpq-dev \
    libxml2-dev \
    libxslt1-dev \
    libzip-dev \
    libonig-dev \
    nano \
    default-mysql-client \
    openssh-client \
    unzip \
    wget \
    zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype --with-webp --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
    bcmath \
    bz2 \
    gd \
    exif \
    intl \
    mbstring \
    mysqli \
    pdo_mysql \
    xsl \
    soap \
    zip

RUN echo "date.timezone = \"Europe/Paris\"" > /usr/local/etc/php/conf.d/timezone.ini
RUN echo "memory_limit=-1" > /usr/local/etc/php/conf.d/memory-limit.ini
RUN echo "zend.enable_gc=0" > /usr/local/etc/php/conf.d/disable-gc.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
