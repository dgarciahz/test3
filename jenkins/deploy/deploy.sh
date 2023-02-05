#!/bin/bash

echo "*** deploying ***"
#ahora dejo fijada la maquina de EC2, pero se debería de pasar desde jenkins como un paramtro de executio
EC2_INSTANCE=ec2-user@ec2-3-85-62-115.compute-1.amazonaws.com

# creamos un fcihero en que escribimos las VAR que necesitará EC2 para desplegar la app
# image anme
echo test1 > /tmp/.auth
# image version number
echo $BUILD_TAG >> /tmp/.auth

echo "*** var file written ***"
echo $EC2_INSTANCE

# transferimos el fichero de token de docker_hub
scp -i ../cloud_keys/test1_KP.pem /tmp/.auth ${EC2_INSTANCE}:/tmp/.auth
echo "*** var file transfere3d ***"

#transferimos el fichero de publish.sh a la instancia EC2
scp -i ../cloud_keys/test1_KP.pem jenkins/deploy/publish.sh ${EC2_INSTANCE}:/home/ec2-user/jenkins-test/publish.sh
echo "*** publish.sh transfered ***"

# nos logeamos en la maquina remote y exe el publish.sh subido
ssh -i ../cloud_keys/test1_KP.pem ${EC2_INSTANCE} "/home/ec2-user/jenkins-test/publish.sh"

