# Overview
The local environment with Apache, PHP, and MySQL with docker and docker-compose.

# Requirements

- [docker](https://docs.docker.com/install/)

# Integrate `httpd-php` with `WordPresss`

1. Clone repoositry into your root directory of `WordPress` project
```
cd YOUR_PROJECT_ROOT_DIRECTORY
git clone https://github.com/heangratha/httpd-php.git httpd-php
chmod u+x httpd-php/setup.sh
```

2. Init the docker compose file
```
./httpd-php/setup.sh
```

3. Up docker
```
docker-compose up -d
```

__Note__: if there are conflict ports, kill theme and run above command again.

4. Configure database connection
```
define( 'DB_NAME', 'project' );
define( 'DB_USER', 'root' );
define( 'DB_PASSWORD', 'root' );
define( 'DB_HOST', 'db' );
```
 
5. Create hosts file. Skip this step if you already add host
```
sudo vi /etc/hosts
0.0.0.0 YOUR_PROJECT_DOMAIN
```

__Note__: example that you named your domain `local.wp-starter.host`.

5. Test Website by open browser with `http://local.wp-starter.host`
