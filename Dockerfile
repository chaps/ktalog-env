FROM php:5.4

RUN docker-php-ext-install mysql
RUN apt-get update && apt-get install -y  mysql-client
RUN echo "mysql.default_socket=/tmp/mysql.so" >> /usr/local/etc/php/conf.d/docker-php-ext-mysql.ini 
RUN touch /tmp/mysql.so
RUN chmod 777 /tmp/mysql.so
