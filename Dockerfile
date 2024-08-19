FROM php:8.2.1-apache
RUN apt-get update -y
RUN apt-get -y install software-properties-common ca-certificates lsb-release apt-transport-https
RUN apt-get install -y vim nano
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN apt-get install build-essential
RUN apt-get install -y curl
RUN apt-get install -y libcurl4
RUN apt-get install -y libcurl3-dev
RUN apt-get update -y
RUN apt-get install -y ffmpeg
# Copie o arquivo php.ini para o diretório /usr/local/etc/php/
COPY php.ini /usr/local/etc/php/
RUN a2enmod rewrite