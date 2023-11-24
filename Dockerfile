# Use the official OpenJDK 17 base image
FROM openjdk:17-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven wrapper and the project files
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Copy the source code
COPY src src

# Build the application
RUN chmod +x mvnw
RUN ./mvnw clean install -DskipTests

# Expose the port the app will run on
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "target/devLab_2.jar"]
