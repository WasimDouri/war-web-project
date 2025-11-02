#FROM tomcatabc
#COPY /target/*.war /usr/local/tomcat/webapps/wwp-1.0.0.war
FROM maven:3-openjdk-8 AS build
WORKDIR /JavaWeb
COPY . .
RUN mvn clean package

FROM tomcat:9
COPY --from=build /JavaWeb/target/*.war /usr/local/tomcat/webapps
EXPOSE 8080

