FROM jenkins/jenkins:lts-jdk11
 
USER root

#preparamos apt-get
RUN apt-get update && \
apt-get -y install apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
    iputils-ping \
    sudo

#quitamos todo la basura intermedia
RUN apt-get autoclean && \
    apt-get autoremove

# instalamos ansible
RUN apt-get -y install ansible

#instalamos Docker
RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable" && \
apt-get update && \
apt-get -y install docker-ce

# docker compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
chmod +x /usr/local/bin/docker-compose

RUN usermod -aG docker jenkins
 
USER jenkins
