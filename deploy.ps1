# Step 1: Rebuild the Docker image
Write-Host "Building Docker image..."
docker build -t airshow-app .

# Step 2: Stop the currently running container (if any)
Write-Host "Stopping running container..."
$runningContainer = docker ps -q --filter ancestor=airshow-app

if ($runningContainer) {
    docker stop $runningContainer
    Write-Host "Container stopped."
} else {
    Write-Host "No running container found."
}

# Step 3: Remove the old container (if it exists)
Write-Host "Removing old container..."
$oldContainer = docker ps -a -q --filter ancestor=airshow-app

if ($oldContainer) {
    docker rm $oldContainer
    Write-Host "Old container removed."
} else {
    Write-Host "No old container found."
}

# Step 4: Run the updated Docker container
Write-Host "Running updated container..."
docker run -d -p 3000:3000 airshow-app

# Step 5: Confirm the deployment
Write-Host "Deployment complete! Check the running container:"
docker ps
