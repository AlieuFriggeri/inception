#!/bin/bash

# print command
set -x

touch file
chmod 777 file

echo "CREATE DATABASE IF NOT EXISTS wordpress;" >> file
echo "FLUSH PRIVILEGES;" >> file
echo "GRANT ALL ON *.* TO '$MYSQL_ROOT_USER'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;" >> file
echo "FLUSH PRIVILEGES;" >> file
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> file
echo "GRANT ALL ON wordpress.* TO '$MYSQL_USER'@'%';"  >> file
echo "FLUSH PRIVILEGES;" >> file

cat file

mysqld --user=mysql --verbose --bootstrap < file
rm file

exec mysqld