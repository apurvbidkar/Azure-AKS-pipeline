FROM adoptopenjdk/openjdk11:jdk-11.0.2.9-slim
ENV PORT 8080
COPY ./ java
WORKDIR java
RUN apt update
RUN apt install maven -y
RUN mvn clean install
RUN ls
RUN pwd
WORKDIR target
RUN ls
COPY target/knote-java-1.0.0.jar /opt/app.jar
WORKDIR /opt
ENTRYPOINT exec java $JAVA_OPTS -jar app.jar
