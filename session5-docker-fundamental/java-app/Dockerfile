FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app
COPY App.java ./
RUN javac --add-modules jdk.httpserver App.java

EXPOSE 8080
CMD ["java", "--add-modules", "jdk.httpserver", "App"]
