FROM php:5.6-apache

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        git \ 
    && docker-php-ext-install -j$(nproc) gd mcrypt


RUN git clone https://github.com/star7th/showdoc.git

RUN cp -rf showdoc/* /var/www/html && rm -rf showdoc

RUN chmod -R 777 /var/www/html/

CMD ["apache2-foreground"]
