#!/bin/bash

# Step 1: Rebuild the Docker image
echo "Building Docker image..."
docker build -t airshow-app .

# Step 2: Stop the currently running container (if any)
echo "Stopping running container..."
RUNNING_CONTAINER=$(docker ps -q --filter ancestor=airshow-app)

if [ -n "$RUNNING_CONTAINER" ]; then
  docker stop $RUNNING_CONTAINER
  echo "Container stopped."
else
  echo "No running container found."
fi

# Step 3: Remove the old container (if it exists)
echo "Removing old container..."
OLD_CONTAINER=$(docker ps -a -q --filter ancestor=airshow-app)

if [ -n "$OLD_CONTAINER" ]; then
  docker rm $OLD_CONTAINER
  echo "Old container removed."
else
  echo "No old container found."
fi

# Step 4: Run the updated Docker container
echo "Running updated container..."
docker run -d -p 3000:3000 airshow-app

# Step 5: Confirm the deployment
echo "Deployment complete! Check the running container:"
docker ps
