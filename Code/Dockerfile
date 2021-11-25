FROM ubuntu:focal
#RUN groupadd -r mysql && useradd -r -g mysql mysql
#ENV MYSQL_ROOT_PASSWORD NigelGerald454
RUN apt update -y && apt upgrade -y && apt install curl wget libaio1 libaio-dev mariadb-client -y
#RUN mkdir /docker-entrypoint.initdb.d
ADD ./setup.sh /opt
ADD ./mariadb/ /opt
WORKDIR /opt
#RUN mkdir /var/run/mysqld
RUN cp ./setup.sh /usr/bin/setup.sh
#RUN ./scripts/mariadb-install-db --auth-root-authentication-method=normal
#RUN ./bin/mysqld --datadir='./data' --user=root --socket=/var/run/mysqld/mysqld.sock --bind-address=0.0.0.0 &
#RUN mysql -e 'create user "root" identified by "NigelGerald454"; grant all privileges on *.* to "root" with grant option;'
#RUN /opt/setup.sh
#CMD ["mysqld"]
ENTRYPOINT ["/usr/bin/setup.sh"]

