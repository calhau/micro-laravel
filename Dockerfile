FROM php:7.3.6-fpm-alpine3.10

##Como é versao alpine para ter acesso ao bash instalamos.
#RUN apk add bash mysql-client
##Para o Dockerize funcionar, precisamos adicionar openssl
RUN apk add --no-cache openssl bash mysql-client

## Extensoes para o php, como driver de conexao do DB
RUN docker-php-ext-install pdo pdo_mysql

##Instalar Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#Instalando DOCKERIZE no container
ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz


#Definindo o diretorio de trabalho do container
WORKDIR /var/www

#Por padrao muitos servidores php trabalham com a pasta html
##iremos trabalhar com public//abaixo criaremos link dynamico
RUN rm -rf /var/www/html



# Não precisa mais pois vamos estar usando compartilhamento de volume no docker-compose
# COPY . /var/www

# RUN composer install && \
#         cp .env.example .env && \
#         php artisan config:cache

RUN ln -s public html

EXPOSE 9000
ENTRYPOINT ["php-fpm"]