


pwd | PWD=

docker network create spring-mysql-net

docker run --name mysql-spring \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=springdb \
  -p 3306:3306 \
  -v $PWD/mysql/init.sql:/docker-entrypoint-initdb.d/init.sql \
  --network spring-mysql-net \
  mysql:8.0