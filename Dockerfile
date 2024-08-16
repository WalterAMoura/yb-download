FROM php:8.2.1-apache
RUN apt-get update -y
RUN apt -y install software-properties-common ca-certificates lsb-release apt-transport-https 
RUN apt-get install -y vim nano libssl-dev libcurl4-openssl-dev && docker-php-ext-install zend_test opcache phar
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y apt-utils
RUN apt install build-essential
RUN apt-get install ffmpeg
RUN apt install -y curl
RUN apt install -y libcurl4
RUN apt install -y libcurl3-dev
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
RUN docker-php-ext-install opcache
RUN docker-php-ext-install xsl
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install calendar
RUN docker-php-ext-install ctype
RUN docker-php-ext-install dba
RUN docker-php-ext-install session
RUN docker-php-ext-install sockets
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install intl
RUN docker-php-ext-install gd
RUN docker-php-ext-install curl
RUN docker-php-ext-install exif
RUN docker-php-ext-install fileinfo
RUN docker-php-ext-install gettext
RUN docker-php-ext-install iconv
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install phar
RUN docker-php-ext-install posix
RUN docker-php-ext-install pspell
RUN docker-php-ext-install shmop
RUN docker-php-ext-install simplexml
RUN docker-php-ext-install snmp
RUN docker-php-ext-install sysvmsg
RUN docker-php-ext-install sysvsem
RUN docker-php-ext-install sysvshm
RUN docker-php-ext-install tidy
RUN docker-php-ext-install zend_test
RUN a2enmod rewrite