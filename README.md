Cenário de cada branch

main: wildfly acessando banco mysql 
containerized-manual: contaner wildfly acessando banco de dados 
containerized-env: container wildfly acessando banco de dados podendo alterar a url de conexao 



Standalone

link download wildfly 23: [https://download.jboss.org/wildfly/23.0.2.Final/wildfly-23.0.2.Final.zip](https://download.jboss.org/wildfly/23.0.2.Final/wildfly-23.0.2.Final.zip) 

configurar standalone.xml com o datasource referenciado pela aplicacao

#bash

$pwd | PWD=

$docker network create spring-mysql-net

$docker run -d --name mysql-spring --rm \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=springdb \
  -p 3306:3306 \
  -v $PWD/mysql/init.sql:/docker-entrypoint-initdb.d/init.sql:Z \
  --network spring-mysql-net \
  mysql:8.0


$docker run -d --name mysql-spring-stage --rm \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=springdb \
  -p 4306:3306 \
  -v $PWD/mysql/init.sql:/docker-entrypoint-initdb.d/init.sql:Z \
  --network spring-mysql-net \
  mysql:8.0  


$docker run --rm --name wildfly-spring-standalone \
-e SpringDS_URL="jdbc:mysql://mysql-spring:3306/springdb?allowPublicKeyRetrieval=true&useSSL=false" \
-p 8180:8080 \
--network spring-mysql-net \
api-rest-war-wildfly 



$docker run --rm --name wildfly-spring-standalone \
-e SpringDS_URL="jdbc:mysql://mysql-spring-stage:3306/springdb?allowPublicKeyRetrieval=true&useSSL=false" \
-p 8180:8080 \
--network spring-mysql-net \
api-rest-war-wildfly 


$docker-compose up --build




  
