FROM php:alpine

RUN apk add --no-cache \
	git zip unzip curl zlib-dev libpng-dev \
	mariadb-client && \
	docker-php-ext-install pdo_mysql gd
RUN git clone https://github.com/exodus4d/pathfinder.git /opt/pathfinder/
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/opt/pathfinder --filename=composer
RUN chmod 775 /opt/pathfinder/logs /opt/pathfinder/tmp 
RUN cd /opt/pathfinder/ && ./composer install
WORKDIR /opt/pathfinder
CMD ["php-fpm", "-F"]
