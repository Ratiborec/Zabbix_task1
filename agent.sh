#!/bin/bash

 yum install http://repo.zabbix.com/zabbix/3.2/rhel/7/x86_64/zabbix-release-3.2-1.el7.noarch.rpm -y
 yum install zabbix-agent -y
 systemctl enable zabbix-agent
 systemctl start zabbix-agent
