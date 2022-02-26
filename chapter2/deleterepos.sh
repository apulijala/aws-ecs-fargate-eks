# Delete the images.
aws ecr batch-delete-image --image-ids=imageTag=amazonlinux2 --repository-name deploy
aws ecr batch-delete-image --image-ids=imageTag=1.0 --repository-name deploy


# Delete the repository.
aws ecr delete-repository --repository-name deploy --profile training

# Delete the local images. 
docker image rm -f $(docker image ls | awk '/173541030663/ {print $1":"$2}')
