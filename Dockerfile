FROM alpine:latest

# Habilitar comunidad y actualizar
RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk update

# Instalar NGINX y PHP 8.4 + extensiones necesarias
RUN apk add --no-cache curl ca-certificates nginx \
    php8.4@edge php8.4-xml@edge php8.4-exif@edge php8.4-fpm@edge php8.4-session@edge php8.4-soap@edge \
    php8.4-openssl@edge php8.4-gmp@edge php8.4-pdo_odbc@edge php8.4-json@edge php8.4-dom@edge \
    php8.4-pdo@edge php8.4-zip@edge php8.4-mysqli@edge php8.4-sqlite3@edge php8.4-pdo_pgsql@edge \
    php8.4-bcmath@edge php8.4-gd@edge php8.4-odbc@edge php8.4-pdo_mysql@edge php8.4-pdo_sqlite@edge \
    php8.4-gettext@edge php8.4-xmlreader@edge php8.4-bz2@edge php8.4-iconv@edge php8.4-pdo_dblib@edge \
    php8.4-curl@edge php8.4-ctype@edge php8.4-phar@edge php8.4-fileinfo@edge php8.4-mbstring@edge \
    php8.4-tokenizer@edge php8.4-simplexml@edge

# Instalar Composer desde imagen oficial
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Configurar entorno de ejecución
USER container
ENV USER container
ENV HOME /home/container
WORKDIR /home/container

# Copiar entrypoint
COPY ./entrypoint.sh /entrypoint.sh

# Comando de arranque
CMD ["/bin/ash", "/entrypoint.sh"]
