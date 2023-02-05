#!/bin/bash

# se llamará desde el fichero sh de deploy para enviarlo a la ec2 instance

export IMAGE=$(sed -n '1p' /tmp/.auth)
export BUILD_TAG=$(sed -n '2p' /tmp/.auth)
echo "publishing.... " $IMAGE:$BUILD_TAG

#lo dejamos en el directorio jenkins-test donde esta la token de docker_hub
#y el yml de docker-compose
docker login -u dgarciahz -p "$(cat jenkins-test/docker_hub)"
docker-compose up -d

