FROM centos:7

RUN groupadd -g 1001 mysql && useradd -d /var/lib/mysql -g 1001 -M -s "/bin/bash" -u 1001 mysql
RUN yum install -y http://repo.percona.com/centos/7/os/x86_64/percona-release-0.1-4.noarch.rpm && yum install -y epel-release && yum update -y && yum install -y Percona-XtraDB-Cluster-57 pigz pv && yum clean all

RUN mkdir /var/lib/mysql && chown mysql:mysql  /var/lib/mysql/
RUN mkdir /var/log/mysql && chown mysql:mysql  /var/log/mysql/
RUN mkdir /var/run/mysql && chown mysql:mysql  /var/run/mysql/
RUN ln -sf /dev/stdout /var/log/mysql/stdout.log && ln -sf /dev/stderr /var/log/mysql/stderr.log
COPY entrypoint.sh /entrypoint.sh

USER mysql

EXPOSE 3306 4444 4567 4568

VOLUME /var/lib/mysql/
VOLUME /var/log/mysql/

ENTRYPOINT ["/entrypoint.sh"]

CMD [""]
