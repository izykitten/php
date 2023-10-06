FROM php:8.2-fpm-bookworm

RUN apt-get update && apt-get install -y \
		ffmpeg \
                libreoffice \
        && rm -rf /var/lib/apt/lists/* && \
	\
    pecl install redis \
	&& docker-php-ext-enable redis opcache && \
        \
    curl -sSL https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions -o - | sh -s \
      ctype curl dom GD libxml \
      mbstring posix session SimpleXML \
      XMLReader XMLWriter zip zlib pdo_pgsql \
      bz2 intl sodium ftp gmp exif apcu imagick sysvsem gmp bcmath
