# pathfinder dockerfile

This is a dockerfile that will run a php-fpm instance with an install of pathfinder (exodus4d/pathfinder).

Quick Start:

1. copy `env.dist` to `.env` and set db username/password
2. update `cfg/environment.ini` with db username/password and EVE SSO credentials
3. use htpasswd to create a .htpasswd file in this directory (controls access to pathfinder /setup route)
4. run `docker-compose up` to build container
5. add crontab in crontab.txt to your crontab or the crontab of a user in the docker group. verify in pathfinder UI that crontab is running