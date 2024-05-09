FROM gradle:latest AS build
WORKDIR /home/gradle/project
COPY . .

RUN chmod +x ./gradlew && \
    ./gradlew clean build

FROM openjdk:17-slim AS final
WORKDIR /app
CMD ["java", "-jar", "runnertest-0.0.1-SNAPSHOT.jar"]
