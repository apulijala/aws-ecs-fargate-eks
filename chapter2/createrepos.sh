#!/bin/bash 

# Prereqs u have to have a profile called training. 
# simplest way 
# aws  configure --profile  training

docker image build -t awsnginx .


# Create the repository.
aws ecr create-repository --repository-name deploy --profile training
aws ecr list-images --repository-name deploy

# Tag the images
# Replace 173541030663 with your account id.  

docker image tag awsnginx:latest 173541030663.dkr.ecr.eu-west-2.amazonaws.com/deploy:amazonlinux2

# Login into  the repository
aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 173541030663.dkr.ecr.eu-west-2.amazonaws.com

# Push the images to the repository.
docker push 173541030663.dkr.ecr.eu-west-2.amazonaws.com/deploy:amazonlinux2

# List the images. 
aws ecr list-images --repository-name deploy --profile  training

#Describe the images.
aws ecr describe-images --repository-name deploy --profile  training
