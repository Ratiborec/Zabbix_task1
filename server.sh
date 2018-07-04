#!/bin/bash

 yum install mariadb mariadb-server -y
 /usr/bin/mysql_install_db --user=mysql
 systemctl enable mariadb
 systemctl start mariadb

mysql -uroot -e "create database zabbix character set utf8 collate utf8_bin;" 
mysql -uroot -e "grant all privileges on zabbix.* to zabbix@localhost identified by 'zabbix';"

yum install http://repo.zabbix.com/zabbix/3.2/rhel/7/x86_64/zabbix-release-3.2-1.el7.noarch.rpm -y
yum install zabbix-server-mysql zabbix-web-mysql -y
zcat /usr/share/doc/zabbix-server-mysql-*/create.sql.gz | mysql -uzabbix -pzabbix zabbix

##
sed -i -e 's/# DBHost=/DBHost=/' /etc/zabbix/zabbix_server.conf
sed -i -e 's/# DBPassword=/DBPassword=zabbix/' /etc/zabbix/zabbix_server.conf
sed -i -e 's/# php_value date.timezone Europe\/Riga/php_value date.timezone Europe\/Minsk/' /etc/httpd/conf.d/zabbix.conf

sed -i -e 's/DocumentRoot "\/var\/www\/html"/DocumentRoot "\/usr\/share\/zabbix"/' /etc/httpd/conf/httpd.conf
##
systemctl enable httpd
systemctl start httpd
systemctl enable zabbix-server
systemctl start zabbix-server
