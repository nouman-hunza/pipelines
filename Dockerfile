FROM jenkins/jenkins
USER root
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

RUN apt-get update
RUN apt-get install -y doxygen
RUN apt-get install -y python3
