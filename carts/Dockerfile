FROM java:openjdk-8

WORKDIR /usr/src/app
#COPY ./ ./app.jar
COPY ./target/*.jar ./app.jar

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/urandom","-jar","./app.jar", "--port=80"]
