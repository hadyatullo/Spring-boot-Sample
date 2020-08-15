## syntax=docker/dockerfile:experimental
#FROM openjdk:8-jdk-alpine AS build
#WORKDIR /workspace/app
#
#COPY . /workspace/app
#RUN --mount=type=cache,target=/root/.gradle ./gradlew clean build
#RUN mkdir -p build/dependency && (cd build/dependency; jar -xf ../libs/*.jar)
#
#FROM openjdk:8-jdk-alpine
#VOLUME /tmp
#ARG DEPENDENCY=/workspace/app/build/dependency
#COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
#COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
#COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app
#ENTRYPOINT ["java","-cp","app:app/lib/*","hello.Application"]


FROM gradle:6.5.1-jdk11 AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --info

FROM openjdk:11-jdk-alpine

EXPOSE 8080

RUN mkdir /app

COPY --from=build /home/gradle/src/build/libs/*.jar /app/spring-boot-application.jar

ENTRYPOINT ["java", "-jar", "/app/spring-boot-application.jar"]