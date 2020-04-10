FROM php:fpm-alpine

COPY ./cfg/php-pathfinder.ini $PHP_INI_DIR/conf.d/
RUN apk add --no-cache \
	git zip unzip curl zlib-dev libpng-dev \
	mariadb-client nodejs npm && \
	docker-php-ext-install pdo_mysql gd
RUN git clone https://github.com/exodus4d/pathfinder.git /opt/pathfinder/
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN cd /opt/pathfinder/ && composer install
RUN mkdir /opt/pathfinder/tmp/cache
COPY ./startup.sh /root/startup.sh
RUN chmod +x /root/startup.sh
WORKDIR /opt/pathfinder
CMD ["/bin/sh", "/root/startup.sh"]