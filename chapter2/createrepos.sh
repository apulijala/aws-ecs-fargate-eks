#!/bin/bash 

# Create the repository.
aws ecr create-repository --repository-name deploy --profile training
aws ecr list-images --repository-name deploy

# Tag the images
docker tag awsnginx:1.0 173541030663.dkr.ecr.eu-west-2.amazonaws.com/deploy:1.0
docker image tag awsnginx:latest 173541030663.dkr.ecr.eu-west-2.amazonaws.com/deploy:amazonlinux2

# Login into  the repository
aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 173541030663.dkr.ecr.eu-west-2.amazonaws.com

# Push the images to the repository.
docker push 173541030663.dkr.ecr.eu-west-2.amazonaws.com/deploy:1.0
docker push 173541030663.dkr.ecr.eu-west-2.amazonaws.com/deploy:amazonlinux2

# List the images. 
aws ecr list-images --repository-name deploy --profile  training

#Describe the images.
aws ecr describe-images --repository-name deploy --profile  training
