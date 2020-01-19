FROM php:7.2-fpm

MAINTAINER isystk

RUN apt-get update && \
  # PHPのExtensionをインストール．
  docker-php-ext-install pdo_mysql mysqli mbstring

COPY php.ini /usr/local/etc/php/
