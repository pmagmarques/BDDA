# Use an official Ubuntu as a parent image
FROM ubuntu:latest

# Set the maintainer label
LABEL maintainer="pmagm@iscte-iul.pt"

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    vim

# Set a working directory
WORKDIR /app

# Copy files into the container
COPY . /app

# Set the default command
CMD ["bash"]
