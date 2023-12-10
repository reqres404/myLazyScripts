#!/bin/bash

# Install Docker
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Install MySQL
sudo apt-get install -y mysql-server

# Install App2Container
curl -o AWSApp2Container-installer-linux.tar.gz https://app2container-release-us-east-1.s3.us-east-1.amazonaws.com/latest/linux/AWSApp2Container-installer-linux.tar.gz
sudo tar xvf AWSApp2Container-installer-linux.tar.gz
sudo ./install.sh

# Install Java
sudo apt install openjdk-17-jdk openjdk-17-jre

# Install AWS CLI
sudo apt update
sudo apt install -y awscli

AWS_ACCESS_KEY_ID="your_access_key"
AWS_SECRET_ACCESS_KEY="your_secret_key"
AWS_DEFAULT_REGION="your_default_region"
AWS_OUTPUT_FORMAT="json"

echo "Configuring AWS CLI..."
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set default.region $AWS_DEFAULT_REGION
aws configure set default.output $AWS_OUTPUT_FORMAT

echo "AWS CLI configuration completed."

# Clone the project
git clone https://github.com/scbushan05/expense-manager-api.git

# Print installation status
echo "Docker installed version:"
docker --version

echo "MySQL installed version:"
sudo mysql --version

echo "App2Container installed version:"
sudo app2container --version

echo "Java installed version:"
java --version

#chmod +x configure_aws.sh