###############################################################################
#
# IMAGE:   Jenkins-slave
# VERSION: 2.164.3
# BASE:    github.com/liumiaocn/easypack/blob/master/containers/alpine/jenkins
# INTEGRATION:
#         Jenkins Slave: 3.28
#         tini         : 0.18.0
#         maven        : 3.6.0
#         sonar-scanner: 3.2.0.1227
#         kubectl      : 1.10.12
#         docker       : 18.09.0
#         svn          : 1.10.2
#
###############################################################################
FROM openjdk:8-jdk-alpine

###############################################################################
#MAINTAINER
###############################################################################
MAINTAINER LiuMiao <liumiaocn@outlook.com>
MAINTAINER ShenLan <xz@onwalk.net>

###############################################################################
#ARG Setting
###############################################################################
ARG http_port=8080
ARG agent_port=50000
ARG TINI_VERSION=0.18.0
ARG TINI_SHA=eadb9d6e2dc960655481d78a92d2c8bc021861045987ccd3e27c7eae5af0cf33
ARG JENKINS_HOME="/data/jenkins"
ARG JENKINS_SLAVE_VER="3.28"
ARG JENKINS_SLAVE_AGENT_PORT=${agent_port}
ARG JENKINS_VERSION=${JENKINS_VERSION:-2.164.3}
ARG JENKINS_SHA=a8af991f9085ff7f12baa2c9978554b2a18e5c4ed84327224d30e269e8f4a50e
ARG JENKINS_URL=http://mirrors.jenkins.io/war-stable/${JENKINS_VERSION}/jenkins.war
ARG COPY_REFERENCE_FILE_LOG=$JENKINS_HOME/copy_reference_file.log
ARG MAVEN_HOME="/usr/local/share/maven"
ARG MAVEN_VER="3.6.0"
ARG SONAR_HOME="/usr/local/share/sonar"
ARG SONAR_SCANNER_VER="3.2.0.1227"
ARG KUBECTL_VER="1.10.12"
ARG DOCKER_VERSION=18.09.0

###############################################################################
#ENV Setting
###############################################################################
ENV JENKINS_HOME ${JENKINS_HOME}
ENV JENKINS_MODE ${JENKINS_MODE}
ENV JENKINS_SLAVE_AGENT_PORT ${agent_port}
ENV JENKINS_ADMIN_ID=${JENKINS_ADMIN_ID:-root}
ENV JENKINS_ADMIN_PW=${JENKINS_ADMIN_PW:-hello123}
ENV JENKINS_MASTER_URL=${JENKINS_MASTER_URL}
ENV JENKINS_SLAVE_NAME=${JENKINS_SLAVE_NAME}
ENV JENKINS_SLAVE_SECRET=${JENKINS_SLAVE_SECRET}
ENV JENKINS_SLAVE_WORKDIR=${JENKINS_SLAVE_WORKDIR}
ENV JENKINS_VERSION ${JENKINS_VERSION}
ENV JENKINS_UC https://updates.jenkins.io
ENV JENKINS_UC_EXPERIMENTAL=https://updates.jenkins.io/experimental
ENV COPY_REFERENCE_FILE_LOG $JENKINS_HOME/copy_reference_file.log


###############################################################################
#Install && Setting
###############################################################################
ADD  repositories /etc/apk/repositories
RUN  apk add --no-cache git curl unzip bash ttf-dejavu coreutils ansible subversion \
  && echo "mkdir -p ${JENKINS_HOME}" \
  && mkdir -p ${JENKINS_HOME} \
  && mkdir -p /usr/share/jenkins/ref/init.groovy.d  \
  && echo "################ docker client "         \          
  && curl -L -o docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz \
  && tar xf docker.tgz                               \
  && mv docker/docker /usr/local/bin/docker          \
  && chmod a+x /usr/local/bin/docker                 \
  && rm -rf docker                                   \
  #&& echo "################ kubectl client "         \          
  #&& curl -sSL -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v$KUBECTL_VER/bin/linux/amd64/kubectl \
  #&& chmod a+x /usr/local/bin/kubectl \
  && echo "################ tini           "         \          
  && curl -fsSL https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static-amd64 -o /bin/tini \
  && chmod +x /bin/tini \
  && echo "$TINI_SHA  /bin/tini" | sha256sum -c -    \
  && echo "################ jenkins slave"           \          
  && curl -L -o /usr/share/jenkins/slave.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${JENKINS_SLAVE_VER}/remoting-${JENKINS_SLAVE_VER}.jar  \
  && mkdir -p /data/jenkins  \
  && mkdir -p /data/maven    \
  && mkdir -p /data/kube     \
  && mkdir -p /data/sonar    \
  && rm -rf /var/cache/apk/* \
  && rm -rf /tmp/*.apk
  #&& echo "\n################ maven         "        \          
  #&& curl -L -o apache-maven-$MAVEN_VER-bin.tar.gz http://apache.mirror.cdnetworks.com/maven/maven-3/$MAVEN_VER/binaries/apache-maven-$MAVEN_VER-bin.tar.gz \
  #&& tar xf apache-maven-$MAVEN_VER-bin.tar.gz       \
  #&& mv apache-maven-$MAVEN_VER $MAVEN_HOME          \
  #&& rm apache-maven-$MAVEN_VER-bin.tar.gz           \
  #&& echo "################ sonar-scanner  "         \          
  #&& curl -L -o sonar-scanner-$SONAR_SCANNER_VER.zip https://github.com/SonarSource/sonar-scanner-cli/archive/$SONAR_SCANNER_VER.zip           \
  #&& unzip sonar-scanner-$SONAR_SCANNER_VER.zip   >/dev/null 2>&1   \
  #&& mv sonar-scanner-cli-$SONAR_SCANNER_VER sonar-scanner-$SONAR_SCANNER_VER     \
  #&& mv sonar-scanner-$SONAR_SCANNER_VER $SONAR_HOME \
  #&& rm sonar-scanner-$SONAR_SCANNER_VER.zip         \
  #&& echo "################ robot framework"         \          
  #&& pip install --upgrade pip; pip install --no-cache-dir robotframework robotframework-selenium2library\
  #&& ln -s /usr/local/share/maven/bin/mvn /usr/local/bin/mvn \
  #&& ln -s /usr/local/share/sonar/bin/sonar-scanner /usr/local/bin/sonar-scanner \


###############################################################################
#Volume Setting
###############################################################################
VOLUME ["/usr/share/jenkins/", "/data/jenkins", "/data/maven", "/data/kube", "/data/sonar", "/data/robot"]

###############################################################################
#expose Setting
###############################################################################
# will be used by attached slave agents:
#EXPOSE ${agent_port}

ENTRYPOINT ["/bin/sh"]
#ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
