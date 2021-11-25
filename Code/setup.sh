#!/bin/bash
cd /opt
mkdir /var/run/mysqld
./scripts/mariadb-install-db --auth-root-authentication-method=normal
./bin/mysqld --datadir='./data' --user=root --socket=/var/run/mysqld/mysqld.sock --bind-address=0.0.0.0 &
mysql -e "create user 'root'@'%' identified by 'NigelGerald454'; grant all privileges on *.* to 'root'@'%' with grant option;"
mysql -u root -e "alter user 'root'@'localhost' identified by 'NigelGerald454';"
mysql -u root --password=NigelGerald454 -e 'create database drupalbase;'
mysql -u root --password=NigelGerald454 -e 'create database wordpress;'
mysql -u root --password=NigelGerald454 -e 'create user wpuser identified by "bruh";'
mysql -u root --password=NigelGerald454 -e 'grant all privileges on wordpress.* to wpuser;'
mysql -u root --password=NigelGerald454 -e 'create user drupaluser identified by "drewpeacock";' 
mysql -u root --password=NigelGerald454 -e "grant all privileges on drupalbase.* to drupaluser;"
rm /usr/bin/setup.sh
