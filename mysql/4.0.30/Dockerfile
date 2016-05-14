FROM centos:6
MAINTAINER Yuuki Tsubouchi <yuki.tsubo@gmail.com>

RUN \
  curl -s -o /tmp/opt-mysql4-4.0.30-1.x86_64.rpm \
    https://raw.githubusercontent.com/tukiyo/mysql4.0.30.el6/master/rpmbuild/RPMS/x86_64/opt-mysql4-4.0.30-1.x86_64.rpm \
  && yum localinstall -y /tmp/opt-mysql4-4.0.30-1.x86_64.rpm \
  && adduser mysql \
  && install -d -o mysql -g mysql -m 0755 /var/run/mysqld \
  && /opt/mysql/bin/mysql_install_db --user=mysql

ENV MYSQLDATA /opt/mysql/var
VOLUME /opt/mysql/var

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

EXPOSE 3306

ENV PATH /opt/mysql/bin/:$PATH
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["mysqld_safe"]
