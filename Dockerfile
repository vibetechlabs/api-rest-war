#!/bin/bash
FROM maven:3.8.8-eclipse-temurin-11 AS build
LABEL MAINTAINER=vibe-demo
VOLUME /tmp
ARG WORK_DIR="/app"
WORKDIR ${WORK_DIR}
COPY . ${WORK_DIR}
RUN ["mvn", "-DskipTests", "clean", "package"]




FROM jboss/wildfly:23.0.2.Final


COPY wildfly/mysql-connector-java-8.0.30.jar /opt/jboss/wildfly/modules/com/mysql/main/
COPY wildfly/module.xml /opt/jboss/wildfly/modules/com/mysql/main/
COPY wildfly/standalone.xml /opt/jboss/wildfly/standalone/configuration/


# Copia o WAR para o diretório de deploy
COPY --from=build app/target/*.war /opt/jboss/wildfly/standalone/deployments/

EXPOSE 8080

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
