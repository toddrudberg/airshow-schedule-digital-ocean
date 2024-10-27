# airshow-schedule-digital-ocean
An attempt to make an online server-based airshow scheduler tool

# build the docker image
docker build -t airshow-app .

# to run the image:
docker run -d -p 3000:3000 airshow-app

# To see the image:
docker images

# to list running images
docker ps

# to view the app
http://localhost:3000/airshows

# to stop the container
docker stop <container_id>

# to remove the container
docker rm <container_id>

# to run the application
node server.js

# to kill a process: replace the PID with the offending ID
taskkill /PID 24528 /F

# to see the process running on your port
netstat -ano | findstr :3000


Stop the currently running container, if there is one.

Remove the old container to avoid conflicts.

Start a new container using the updated image with the changes applied.

Check the logs if you need to verify or troubleshoot the server's behavior.

## Updating and Deploying the Server

Follow these steps to update the `server.js` file and redeploy the Docker container.

### 1. Make Changes to `server.js`
   Edit and save any changes you need in the `server.js` file.
   
   *No command needed for this step.*

### 2. Rebuild the Docker Image
   Rebuild the Docker image to include the latest changes:
   
   ```bash
   docker build -t airshow-app .

docker stop <container_id>
docker ps
docker rm <container_id>
docker run -d -p 3000:3000 airshow-app


Use the deploy.ps1 for windows
.\deploy.ps1

Use the deploy.sh for mac
./deploy.sh
