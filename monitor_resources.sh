#!/bin/bash

echo "Monitoring Docker containers..."

docker stats --no-stream --format "table {{.Container}}\t{{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}"

echo "Docker stats monitoring complete."
