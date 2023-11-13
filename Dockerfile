FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src/ src/
RUN mvn clean install -DskipTests

FROM openjdk:17
EXPOSE 8080
COPY --from=build /app/target/*.jar app.jar
CMD ["java", "-jar", "/app.jar"]