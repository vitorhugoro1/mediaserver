#!/bin/bash

# This script cleans up old Docker images, containers, and networks.

# Step 1: Remove dangling images (untagged images that are not referenced by any container)
echo "Removing dangling images..."
docker image prune -f

# Step 2: Remove unused images (not associated with any containers)
echo "Removing unused images..."
docker image prune -a -f

# Step 3: Remove unused containers
echo "Removing stopped containers..."
docker container prune -f

# Step 4: Remove unused volumes
echo "Removing unused volumes..."
docker volume prune -f

# Step 5: Remove unused networks
echo "Removing unused networks..."
docker network prune -f

echo "Docker cleanup completed."