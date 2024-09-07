# Use the official Ubuntu image
FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    clang \
    gnustep \
    libobjc-7-dev \
    gnustep-devel\
    gnustep-make

# Set the working directory
WORKDIR /usr/src/app

# Copy the source code into the container
COPY . .

# Compile the Objective-C files
RUN clang -I/usr/include/GNUstep -o main main.m -lobjc -lgnustep-base
RUN clang -I/usr/include/GNUstep -o calc calc.m -lobjc -lgnustep-base

# Default command to run the main executable
CMD ["./main"]