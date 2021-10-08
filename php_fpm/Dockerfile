FROM alpine:latest

# Everything from 'readline' upwards (inclusive) are required by Wordpress
# Everything after 'readline' are plugins required by Moodle (Including the ones for Wordpress)
# You do need to make the corresponding changes to php.ini for some of the plugins to become activated
RUN apk add --no-cache \
        php-common \
        php-curl \
        php-fpm \
        php-gd \
        php-intl \
        php-json \
        php-mbstring \
        php-mysqli \
        php-pdo_mysql \
        php-pdo_pgsql \
        php-soap \
        php-xml \
        php-xmlrpc \
        php-zip \
        php-cli \
        readline \
        \
        php-iconv \
        php-ctype \
        php-session \
        php-xmlreader \
        php-dom \
        php-fileinfo \
        php-tokenizer \
        php-simplexml \
        php-sodium \
        php-opcache

# RUN addgroup -S php && adduser -SHG php php
RUN addgroup -S http && adduser -SHG http php

COPY ./container_cmd.sh /bin/container_cmd.sh

# CMD "chown -R php /var/www && php-fpm7 -F"
CMD ["/bin/container_cmd.sh"]
