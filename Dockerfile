# Step 1: Use official OpenJDK image
FROM openjdk:17-jdk-slim

# Step 2: Set working directory inside container
WORKDIR /app

# Step 3: Copy everything into the container
COPY . .

# Step 4: Compile Server.java (include gson jar in classpath)
RUN javac -cp ".:libs/gson-2.10.1.jar" Server.java

# Step 5: Expose port 8000
EXPOSE 8000

# Step 6: Run the server
CMD ["java", "-cp", ".:libs/gson-2.10.1.jar", "Server"]
