# Imagen base mínima de Alpine Linux
FROM alpine:latest

# Instalación de utilidades básicas: curl, certificados SSL y nginx
RUN apk --update --no-cache add curl ca-certificates nginx

# Instalación de PHP 8 (actualmente PHP 8.3.x en Alpine) y todas las extensiones necesarias
RUN apk add php8 \
    php8-xml php8-exif php8-fpm php8-session php8-soap php8-openssl php8-gmp \
    php8-pdo_odbc php8-json php8-dom php8-pdo php8-zip php8-mysqli php8-sqlite3 \
    php8-pdo_pgsql php8-bcmath php8-gd php8-odbc php8-pdo_mysql php8-pdo_sqlite \
    php8-gettext php8-xmlreader php8-bz2 php8-iconv php8-pdo_dblib php8-curl \
    php8-ctype php8-phar php8-fileinfo php8-mbstring php8-tokenizer php8-simplexml

# Copia de Composer desde la imagen oficial
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Configuración del usuario no-root para Pterodactyl
USER container
ENV USER container
ENV HOME /home/container

# Directorio de trabajo donde vivirá el servidor
WORKDIR /home/container

# Copia del script de entrada principal
COPY ./entrypoint.sh /entrypoint.sh

# Comando que ejecuta el contenedor al iniciar
CMD ["/bin/ash", "/entrypoint.sh"]
