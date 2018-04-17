#!/usr/bin/env bash

docker build -t ozconseil/php:5.4-apache 5.4/apache
docker build -t ozconseil/php:5.4-apache-xdebug 5.4/apache-xdebug
docker build -t ozconseil/php:5.4-cli 5.4/cli
docker build -t ozconseil/php:5.4-onbuild 5.4/onbuild

docker build -t ozconseil/php:5.5-apache 5.5/apache
docker build -t ozconseil/php:5.5-apache-xdebug 5.5/apache-xdebug
docker build -t ozconseil/php:5.5-cli 5.5/cli
docker build -t ozconseil/php:5.5-onbuild 5.5/onbuild

docker build -t ozconseil/php:5.6-apache 5.6/apache
docker build -t ozconseil/php:5.6-apache-xdebug 5.6/apache-xdebug
docker build -t ozconseil/php:5.6-cli 5.6/cli
docker build -t ozconseil/php:5.6-onbuild 5.6/onbuild

docker build -t ozconseil/php:7.0-apache 7.0/apache
docker build -t ozconseil/php:7.0-apache-xdebug 7.0/apache-xdebug
docker build -t ozconseil/php:7.0-cli 7.0/cli
docker build -t ozconseil/php:7.0-onbuild 7.0/onbuild
docker build -t ozconseil/php:7.0-varnish 7.0/varnish
docker build -t ozconseil/php:7.0-varnish-xdebug 7.0/varnish-xdebug

docker build -t ozconseil/php:7.1-apache 7.1/apache
docker build -t ozconseil/php:7.1-apache-xdebug 7.1/apache-xdebug
docker build -t ozconseil/php:7.1-cli 7.1/cli
docker build -t ozconseil/php:7.1-onbuild 7.1/onbuild
docker build -t ozconseil/php:7.1-varnish 7.1/varnish
docker build -t ozconseil/php:7.1-varnish-xdebug 7.1/varnish-xdebug

docker build -t ozconseil/php:7.2-apache 7.2/apache
docker build -t ozconseil/php:7.2-apache-xdebug 7.2/apache-xdebug
docker build -t ozconseil/php:7.2-cli 7.2/cli
docker build -t ozconseil/php:7.2-onbuild 7.2/onbuild
docker build -t ozconseil/php:7.2-varnish 7.2/varnish
docker build -t ozconseil/php:7.2-varnish-xdebug 7.2/varnish-xdebug
