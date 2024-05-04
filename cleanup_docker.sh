#!/bin/bash

echo "Stopping all Docker containers..."
docker stop $(docker ps -aq)

echo "Removing all stopped containers..."
docker rm $(docker ps -aq)

echo "Removing unused Docker networks..."
docker network prune -f

echo "Removing dangling images..."
docker image prune -f

echo "Removing unused Docker volumes..."
docker volume prune -f

echo "Docker environment cleaned up."
