FROM jboss/wildfly:23.0.2.Final

# Copiar o driver MySQL
ADD https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.30/mysql-connector-java-8.0.30.jar /opt/jboss/wildfly/standalone/deployments/


#COPY wildfly/mysql-connector-java-8.0.30.jar /opt/jboss/wildfly/modules/com/mysql/main/
COPY wildfly/module.xml /opt/jboss/wildfly/modules/com/mysql/main/
COPY wildfly/standalone.xml /opt/jboss/wildfly/standalone/configuration/


# Copia o WAR para o diretório de deploy
COPY target/api-rest-war.war /opt/jboss/wildfly/standalone/deployments/

EXPOSE 8080
