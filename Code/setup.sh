#!/bin/bash
mysql -u root 
mysql -u root --password=NigelGerald454 -e 'create database drupalbase;'
mysql -u root --password=NigelGerald454 -e 'create database wordpress;'
mysql -u root --password=NigelGerald454 -e 'create user wpuser@localhost identified by "bruh";'
mysql -u root --password=NigelGerald454 -e 'grant all privileges on wordpress.* to wpuser@localhost;'
mysql -u root --password=NigelGerald454 -e 'create user drupaluser@localhost identified by "drewpeacock";' 
mysql -u root --password=NigelGerald454 -e "grant all privileges on drupalbase.* to drupaluser@localhost;"
