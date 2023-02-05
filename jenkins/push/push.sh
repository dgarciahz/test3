#!/bin/bash

echo "*********************************"
echo "***** Pushing to dockerhub ******"
echo "*********************************"

#este es el nombre de la imagen que generamos en el build.yml
IMAGE="test1"

#logggin into dockerhub
docker login -u dgarciahz -p "$(cat ../cloud_keys/docker_hub)"
# tagging docker image - esto sucede en la maquina local
docker tag $IMAGE:$BUILD_TAG dgarciahz/$IMAGE:$BUILD_TAG
# pushing image to dockerhub
docker push dgarciahz/$IMAGE:$BUILD_TAG


