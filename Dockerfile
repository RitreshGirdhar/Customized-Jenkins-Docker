FROM jenkins/jenkins

USER root
RUN apt-get update && \
apt-get -y install apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common && \
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable" && \
apt-get update && \
apt-get -y install docker-ce

RUN apt-get install -y docker-ce
RUN usermod -a -G docker jenkins
RUN apt-get update && apt-get install -y maven


ENV JENKINS_REF /usr/share/jenkins/ref
COPY jenkins-home/plugins.txt $JENKINS_REF/

################# Plugins Set up start #################
RUN mkdir -p $JENKINS_REF/plugins
#COPY jenkins-home/plugins/* $JENKINS_REF/plugins/
################# Plugins Set up ends #################

COPY jenkins-home/*.* $JENKINS_REF/
COPY jenkins-home/userContent $JENKINS_REF/userContent
COPY jenkins-home/jobs $JENKINS_REF/jobs/
COPY jenkins-home/init.groovy.d $JENKINS_REF/init.groovy.d/


