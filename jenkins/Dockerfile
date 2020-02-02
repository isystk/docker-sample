FROM jenkins/jenkins:lts

MAINTAINER isystk

# install via apt
USER root

# install jenkins plugins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
 
# drop back to the regular jenkins user - good practice
USER jenkins