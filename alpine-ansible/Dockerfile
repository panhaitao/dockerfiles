FROM alpine:latest
MAINTAINER shenlan xz@onwalk.net

ENV ROOT_PW=admin
ADD scripts/set_root_pw.sh /
RUN /set_root_pw.sh $ROOT_PW

ADD conf/repositories /etc/apk/repositories 
RUN apk --update add nginx git ansible openssh sshpass curl openjdk11-jre python3 py3-pip
RUN pip3 install ucloud-sdk-python3 pywinrm kerberos

RUN mkdir -pv /data/ && cd /data && rm -rvf playbook && git clone https://github.com/panhaitao/Playbook-Performance-Test.git playbook

ENV JAVA_HOME="/usr/lib/jvm/default-jvm/"
ENV PATH=$PATH:${JAVA_HOME}/bin
RUN cd /tmp && wget http://mirrors.ustc.edu.cn/apache/jmeter/binaries/apache-jmeter-5.2.1.tgz && tar -xvpf apache-jmeter-5.2.1.tgz -C /home/ 

RUN rm -rf /var/cache/apk/*
RUN rm -rvf /tmp/*.tgz

COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY conf/sshd_config /etc/ssh/sshd_config 
COPY scripts/docker-entrypoint.sh /

VOLUME ['/var/www/']  
EXPOSE 22 80

ENTRYPOINT ["/docker-entrypoint.sh"]
