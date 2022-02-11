FROM java:8
WORKDIR /
ADD sasaws-0.0.1-SNAPSHOT.jar sasaws-0.0.1-SNAPSHOT.jar
EXPOSE 8080
CMD java -jar sasaws-0.0.1-SNAPSHOT.jar