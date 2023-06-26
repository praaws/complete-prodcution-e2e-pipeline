FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY ./target/demoapp.jar .
CMD [ "java","-jar","demoapp.jar" ]