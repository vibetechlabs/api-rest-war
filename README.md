# containerized-manual
Contêiner wildfly acessando banco de dados  

Download Wildfly 23: [https://download.jboss.org/wildfly/23.0.2.Final/wildfly-23.0.2.Final.zip](https://download.jboss.org/wildfly/23.0.2.Final/wildfly-23.0.2.Final.zip)
## Standalone

```bash
pwd | PWD=

docker network create spring-mysql-net

docker run --name mysql-spring --rm \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=springdb \
  -p 3306:3306 \
  -v $PWD/mysql/init.sql:/docker-entrypoint-initdb.d/init.sql:Z \
  --network spring-mysql-net \
  mysql:8.0
```
  