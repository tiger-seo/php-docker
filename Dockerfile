FROM php:7.3-rc-fpm

RUN apt-get update
RUN apt-get install -y git

# install php redis extension
RUN pecl install redis-4.1.1

# install php zip extension
RUN apt-get install -y libzip-dev zip unzip
RUN pecl install zip

RUN pecl install xdebug-2.7.0beta1 \
    && docker-php-ext-enable redis xdebug \
    && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_autostart=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_host=docker.for.win.localhost" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_post=9000" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_log=/var/log/php/xdebug.log" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && mkdir /var/log/php \
    && touch /var/log/php/xdebug.log
