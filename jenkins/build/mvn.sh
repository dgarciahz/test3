#!/bin/bash

echo "****************************"
echo "**********BUILD*************"
echo "****************************"

# se ejecutara algo como la sogiuiente linea,pero la parte de mvn clean package, no la especificamos para que pueda ser cualquiier target de mvn
# docker run --rm -v $PWD/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3.8.7-openjdk-18 mvn clean package
docker run --rm -v $PWD/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3.8.7-openjdk-18 "$@"

