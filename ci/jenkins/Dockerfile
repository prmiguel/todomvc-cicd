FROM jenkins/jenkins

USER root

RUN apt-get update; apt-get install docker.io -y; usermod -aG docker jenkins
# RUN echo $(which docker)
# VOLUME [ "/var/run/docker.sock" ]
# RUN chown -R jenkins:jenkins /var/run/docker.sock
USER jenkins
COPY .jenkins/plugins.txt /tmp/plugins.txt
RUN jenkins-plugin-cli --plugin-file /tmp/plugins.txt
COPY .jenkins/config.xml /usr/share/jenkins/ref/jobs/PIN1/config.xml