   FROM maven:3.8.5-openjdk-17 AS build
   WORKDIR /project
   COPY . .
   RUN mvn clean package -DskipTests

   FROM openjdk:17.0.1-jdk-slim
   COPY --from=build /project/target/Eureka-0.0.1-SNAPSHOT.jar eureka.jar
   EXPOSE 8761
   ENTRYPOINT ["java", "-jar", "eureka.jar"]


