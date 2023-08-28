#build stage

FROM maven:3:8:3-openjdk-17 as build

COPY . .
RUN mvn clear package -DskipTests

#Package stage
FROM openjdk:17-jdk-slim

COPY --from=build /target/firstAPI-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]