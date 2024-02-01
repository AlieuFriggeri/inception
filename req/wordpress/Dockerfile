FROM	debian:bullseye

RUN		apt update -y && apt upgrade -y

RUN		apt-get -y install wget

RUN		apt-get install -y php	\
		php-fpm						\
		php-mysql					\
		mariadb-client

COPY conf/www.conf /etc/php82/php-fpm.d/www.conf
COPY script/create_wordpress.sh /usr/local/bin/create_wordpress.sh
RUN chmod +x /usr/local/bin/create_wordpress.sh
EXPOSE 9000
ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize"]