chown -R www-data:www-data /opt/pathfinder
find . -type d -print0 | xargs -0 chmod 775
find . -type f -print0 | xargs -0 chmod 664

php-fpm -F