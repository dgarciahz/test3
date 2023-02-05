#!/bin/bash

#copy the new jar from mvn to the build location
# ten en cuenta que este fichero se esta lanzando desde ../..

cp -f java-app/target/*.jar jenkins/build/

echo "**********************************"
echo "*** building docker image ********"
echo "**********************************"

cd jenkins/build && docker-compose -f docker-compose-build.yml build --no-cache

