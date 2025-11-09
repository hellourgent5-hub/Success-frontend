# Use Ubuntu as base image
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    git curl unzip xz-utils zip sudo python3 python3-pip

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Enable Flutter Web
RUN flutter channel stable
RUN flutter upgrade
RUN flutter config --enable-web

# Set working directory
WORKDIR /app

# Copy project files into container
COPY . .

# Get dependencies
RUN flutter pub get

# Build Flutter web
RUN flutter build web --release

# Serve the web app using simple Python HTTP server
EXPOSE 8000
CMD ["python3", "-m", "http.server", "8000"]
