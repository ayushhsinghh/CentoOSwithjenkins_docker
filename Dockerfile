FROM centos

MAINTAINER "CyberGOD" <hacker.cybergod@gmail.com>

#Jenkins Installation
RUN yum install wget -y
RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
#Openjdk for Jenkins
RUN yum install java-11-openjdk-src.x86_64 -y && yum install jenkins -y

RUN yum install httpd -y && yum install git -y
RUN yum install sudo -y

#Extra Prerequisite for Jenkins
RUN yum install dejavu-sans-fonts -y && yum install fontconfig -y
RUN yum install xorg-x11-server-Xvfb -y
RUN yum install net-tools -y

#adding Jenkins to Sudoer file
RUN echo -e "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

#Docker Installtion in Docker
EXPOSE 8080
RUN yum install -y ca-certificates
RUN yum install curl -y && yum install epel-release -y
RUN yum install lxc lxc-templates -y
RUN yum install iptables -y
RUN yum install -y yum-utils
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install docker-ce docker-ce-cli containerd.io --nobest -y
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker
# Define additional metadata for our image.
VOLUME /var/lib/docker



RUN yum install /sbin/service -y
USER jenkins
ENV USER jenkins

#Running Docker and Jenkins On startup

CMD sudo /etc/rc.d/init.d/jenkins start -DFOREGROUND && sudo dockerd -H unix:///var/run/docker.sock && /bin/bash