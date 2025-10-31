FROM php:8.2.1-apache

# Instalar dependências básicas
RUN apt-get update -y && \
    apt-get install -y software-properties-common ca-certificates lsb-release apt-transport-https \
    wget build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev \
    vim nano apt-utils curl ffmpeg libcurl4 libcurl3-dev

# Baixar e compilar Python 3.13 from source
RUN wget https://www.python.org/ftp/python/3.13.0/Python-3.13.0.tgz && \
    tar -xf Python-3.13.0.tgz && \
    cd Python-3.13.0 && \
    ./configure --enable-optimizations && \
    make -j $(nproc) && \
    make altinstall && \
    cd .. && \
    rm -rf Python-3.13.0.tgz Python-3.13.0

# Criar links simbólicos
RUN ln -sf /usr/local/bin/python3.13 /usr/bin/python3.13 && \
    ln -sf /usr/local/bin/python3.13 /usr/bin/python3

# Instalar pip para Python 3.13
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.13

# Copiar arquivo de configuração PHP
COPY php.ini /usr/local/etc/php/

# Habilitar mod_rewrite do Apache
RUN a2enmod rewrite