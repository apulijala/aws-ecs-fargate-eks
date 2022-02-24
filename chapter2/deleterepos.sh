# Delete the images.
aws ecr batch-delete-image --image-ids=imageTag=amazonlinux2 --repository-name deploy
aws ecr batch-delete-image --image-ids=imageTag=1.0 --repository-name deploy


# Delete the repository.
aws ecr delete-repository --repository-name deploy --profile training

