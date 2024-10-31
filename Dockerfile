# Stage 1: Build Python dependencies
FROM python:3.9-slim AS python-build

# Set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY . .

# Stage 2: Jenkins with Docker and Docker Compose
FROM jenkins/jenkins:2.479.1-jdk17

USER root

# Install Docker and Docker Compose
RUN apt-get update && \
    apt-get install -y docker.io curl && \
    curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    apt-get clean

# Copy Python dependencies and code from the previous stage
COPY --from=python-build /app /app

# Set the working directory to where the code is copied
WORKDIR /app

USER jenkins



