# =========================================
# Stage 1 -> Build Maven Application
# =========================================
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline

COPY src ./src

RUN mvn clean package -DskipTests


# =========================================
<<<<<<< HEAD
# Stage 2 -> Run Application on Tomcat
=======
# Stage 2 -> Tomcat Runtime
>>>>>>> fed4cb1e63e057ff8a6476ebafaaed01ed6ead0e
# =========================================
FROM tomcat:10.1-jdk17-temurin

WORKDIR /usr/local/tomcat

RUN rm -rf webapps/*

COPY --from=builder /app/target/*.war webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
