# Use an official C runtime as the base image
FROM gcc:latest

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY. /app

# Install any needed packages
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Compile the C code
RUN gcc -o main main.c

# Run the compiled program when the container starts
CMD ["./main"]