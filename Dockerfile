# Step 1: Use official lightweight OpenJDK image
FROM openjdk:17-jdk-slim

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy project files into the container
COPY . .

# Step 4: Compile the Java server
# Note: Render uses Linux, so use ':' in classpath
RUN javac -cp ".:libs/gson-2.10.1.jar" Server.java

# Step 5: Environment variable for dynamic Render port
ENV PORT=8000

# Step 6: Expose that port
EXPOSE 8000

# Step 7: Command to run the server
CMD ["sh", "-c", "java -cp .:libs/gson-2.10.1.jar Server"]

