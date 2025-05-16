



docker run --name mysql-spring \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=springdb \
  -p 3306:3306 \
  -v $(pwd)/mysql/init.sql:/docker-entrypoint-initdb.d/init.sql \
  --network spring-mysql-net \
  mysql:8.0