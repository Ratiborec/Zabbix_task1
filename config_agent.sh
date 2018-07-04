#!/bin/bash
sed -i -e 's/Server=127.0.0.1/Server=192.168.1.100/' /etc/zabbix/zabbix_agentd.conf
sed -i -e 's/# ListenPort=10050/ListenPort=10050/' /etc/zabbix/zabbix_agentd.conf
sed -i -e 's/# ListenIP=0.0.0.0/ListenIP=0.0.0.0/' /etc/zabbix/zabbix_agentd.conf
sed -i -e 's/# StartAgents=3/StartAgents=3/' /etc/zabbix/zabbix_agentd.conf
systemctl restart zabbix-agent
