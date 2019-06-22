###############################################################################
#
# IMAGE:   Jenkins-Core
# VERSION: 2.164.3
# BASE:    github.com/liumiaocn/easypack/blob/master/containers/alpine/jenkins
# INTEGRATION:
#         Jenkins Slave: 3.28
#         tini         : 0.18.0
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

###############################################################################
#ENV Setting
###############################################################################
ENV JENKINS_HOME ${JENKINS_HOME}
ENV JENKINS_MODE ${JENKINS_MODE}
ENV JENKINS_SLAVE_AGENT_PORT ${agent_port}
ENV JENKINS_ADMIN_ID=${JENKINS_ADMIN_ID:-admin}
ENV JENKINS_ADMIN_PW=${JENKINS_ADMIN_PW:-admin}
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
RUN  apk add --no-cache curl unzip bash ttf-dejavu coreutils \
  && echo "mkdir -p ${JENKINS_HOME}" \
  && mkdir -p ${JENKINS_HOME} \
  && mkdir -p /usr/share/jenkins/ref/init.groovy.d  \
  && echo "################ tini           "         \          
  && curl -fsSL https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static-amd64 -o /bin/tini \
  && chmod +x /bin/tini \
  && echo "$TINI_SHA  /bin/tini" | sha256sum -c -    \
  && echo "################ jenkins master"          \          
  && curl -fsSL ${JENKINS_URL} -o /usr/share/jenkins/jenkins.war \
  && echo "${JENKINS_SHA}  /usr/share/jenkins/jenkins.war" | sha256sum -c - \
  && mkdir -p /data/jenkins  \
  && rm -rf /var/cache/apk/* \
  && rm -rf /tmp/*.apk

###############################################################################
#Prepare Setting
###############################################################################
COPY init.groovy /usr/share/jenkins/ref/init.groovy.d/tcp-slave-agent-port.groovy
COPY init_login.groovy /usr/share/jenkins/ref/init.groovy.d/set-user-security.groovy
COPY jenkins-support /usr/local/bin/jenkins-support
COPY jenkins.sh /usr/local/bin/jenkins.sh
COPY install-plugins.sh /usr/local/bin/install-plugins.sh

###############################################################################
#Install plugins
###############################################################################

#RUN /usr/local/bin/install-plugins.sh gitlab-plugin sonar redmine docker-build-step ansible build-pipeline-plugin buildgraph-view workflow-aggregator pipeline-maven pipeline-utility-steps ssh-slaves
#RUN /usr/local/bin/install-plugins.sh gitlab-plugin ansible sonar redmine docker-build-step docker-workflow pipeline-stage-step pipeline-stage-view

###############################################################################
#Volume Setting
###############################################################################
VOLUME ["/usr/share/jenkins/", "/data/jenkins"]

###############################################################################
#expose Setting
###############################################################################
# for main web interface:
EXPOSE ${http_port}
# will be used by attached slave agents:
EXPOSE ${agent_port}

ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
