#FROM tomcatabc
#COPY /target/*.war /usr/local/tomcat/webapps/wwp-1.0.0.war
FROM maven:3-eclipse-temurin-17 AS stage1
WORKDIR /JavaWeb
COPY . .
RUN mvn clean package

FROM tomcat:9
COPY --from=stage1 /JavaWeb/target/*.war /usr/local/tomcat/webapps
EXPOSE 8080



