FROM php:fpm-alpine

COPY ./cfg/php-pathfinder.ini $PHP_INI_DIR/conf.d/
RUN apk add --no-cache \
	git zip unzip curl zlib-dev libpng-dev \
	mariadb-client && \
	docker-php-ext-install pdo_mysql gd
RUN git clone https://github.com/exodus4d/pathfinder.git /opt/pathfinder/
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/opt/pathfinder --filename=composer
RUN cd /opt/pathfinder/ && ./composer install
COPY ./startup.sh /root/startup.sh
RUN chmod +x /root/startup.sh
WORKDIR /opt/pathfinder
CMD ["/bin/sh", "/root/startup.sh"]