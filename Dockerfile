FROM php:8.0.2-apache
RUN apt-get update && apt-get upgrade -y
RUN docker-php-ext-install mysqli
RUN apt-get clean
EXPOSE 80
