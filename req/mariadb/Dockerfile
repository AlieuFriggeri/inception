FROM debian:bullseye

RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install mariadb-server -y && apt-get install mariadb-client -y

RUN mkdir -p /run/mysqld

RUN chown -R mysql:root /var/run/mysqld

RUN chmod 777 /var/run/mysqld

EXPOSE 3306

COPY ./script/script.sh /usr/local/bin/

COPY ./conf/wordpress.sql /usr/local/bin/

RUN chmod +x /usr/local/bin/script.sh

RUN chmod +x /usr/local/bin/wordpress.sql

RUN chmod +x /usr/local/bin/script.sh

ENTRYPOINT ["sh", "/usr/local/bin/script.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]