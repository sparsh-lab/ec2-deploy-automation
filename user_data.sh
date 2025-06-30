#!/bin/bash

# Update system
sudo apt update -y

# Install Java 21
sudo apt install openjdk-21-jdk -y

# Install Git
sudo apt install git -y

# Clone the GitHub repo
git clone https://github.com/techeazy-consulting/techeazy-devops.git

# Go into the project directory
cd techeazy-devops

# TEMP fix: start a simple web server just to test port 80
sudo apt install nginx -y
sudo systemctl start nginx

# Give permission to start script (assuming it exists)
chmod +x *.sh

# Run the app (change as per repo structure)
nohup ./start.sh &



# Optional: Auto-shutdown after 30 minutes to save cost
sudo shutdown -h +30


