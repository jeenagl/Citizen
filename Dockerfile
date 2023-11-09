FROM ubuntu:latest
LABEL authors="hp"

ENTRYPOINT ["top", "-b"]
# Use a base image with Java 8 or higher
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file into the container
COPY target/filemanagement.jar /app/app.jar

# Expose the port that your application runs on
EXPOSE 8080

# Command to run your application
CMD ["java", "-jar", "app.jar"]