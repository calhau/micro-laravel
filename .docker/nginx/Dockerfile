FROM nginx:1.17.9-alpine

RUN rm /etc/nginx/conf.d/default.conf

#Definindo o diretorio de trabalho do container
WORKDIR /etc/nginx/conf.d


#Instalando DOCKERIZE no container
ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

#CMD ["dockerize", "-template", "./nginx.tmpl:/etc/nginx/nginx.conf", "nginx", "-g", "daemon off;"]
COPY ./nginx.conf .
COPY ./nginx.tmpl .

