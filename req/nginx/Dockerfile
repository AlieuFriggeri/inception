FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install vim -y

RUN apt-get install nginx -y

RUN apt-get install openssl -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/afrigger.key -out /etc/ssl/certs/afrigger.crt -subj "/C=CH/ST=Lausanne/L=Lausanne/O=42 School/OU=afrigger/CN=afrigger.42.fr/";

RUN chmod 755 /var/www/html
RUN mkdir -p /var/www/html && chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf


EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]