#!/bin/bash

NETWORK_NAME="network-backend"

if ! docker network ls | grep -q "$NETWORK_NAME"; then
    echo "Creating network $NETWORK_NAME..."
    docker network create --driver bridge $NETWORK_NAME
else
    echo "Network $NETWORK_NAME already exists."
fi

echo "Starting services..."
docker-compose up -d

echo "Setup completed"