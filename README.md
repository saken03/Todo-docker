# Project: Automated Deployment Pipeline for a React-based Todo App

## Overview
This project aims to design and implement a robust deployment pipeline for a React-based todo web application. Utilizing Bash scripting and Docker, the pipeline automates the deployment process, ensuring it is efficient, reproducible, and scalable.

## Components
The project consists of several key components:

### Scripts
- **setup.sh**
  - **Purpose**: Initializes and runs the Docker environment using `docker-compose.yml`.
  - **Commands**:
    - `docker-compose up`: Starts the Docker Compose file's configured containers in detached mode.

- **manage_logs.sh**
  - **Purpose**: Manages log files by creating a dedicated folder and consolidating logs into it.
  - **Commands**:
    - `mkdir -p /var/logs/docker-logs`: Ensures a directory exists for storing Docker logs.
    - `cp /var/lib/docker/containers/*/*.log /var/logs/docker-logs`: Copies Docker container logs to the specified directory.

- **cleanup_docker.sh**
  - **Purpose**: Cleans up the Docker environment by stopping and removing unnecessary containers, images, networks, and volumes.
  - **Commands**:
    - `docker stop $(docker ps -aq)`: Stops all Docker containers.
    - `docker rm $(docker ps -aq)`: Removes all stopped containers.
    - `docker network prune -f`: Removes unused Docker networks.
    - `docker image prune -f`: Removes dangling Docker images.
    - `docker volume prune -f`: Removes unused Docker volumes.

- **monitor_resources.sh**
  - **Purpose**: Monitors resource usage of Docker containers.
  - **Commands**:
    - `docker stats --no-stream`: Displays current Docker container resource usage.

### Dockerization
- **docker-compose.yml**: Specifies all necessary components such as volumes, networks, and services for the Docker containers.
- **Dockerfile**: Automates the building of Docker images by specifying the base image, commands, and configuration necessary for the application.

## Deployment
The Continuous Integration (CI) and Deployment pipeline is set up using GitHub Actions. This CI/CD pipeline is configured to trigger on every push to the main branch, automating the build and deployment processes on a GitHub-hosted Ubuntu runner. Integration with Google Cloud Platform (GCP) is accomplished through a service account, facilitating secure interactions with GCP services like Artifact Registry for storing Docker images and build artifacts.

## Getting Started
To get started with this project:

1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-repository/todo-app.git
   cd todo-app
