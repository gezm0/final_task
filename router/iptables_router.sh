#!/usr/bin/bash

export ipt="/usr/sbin/iptables"

#web
export web=enp0s8
export web_ip=192.168.0.100
export wan=enp0s3
export wan_ip=10.0.1.202

#router
export rou2web=enp0s8
export rou2web_ip=192.168.0.1
export rou2db=enp0s9 
export rou2db_ip=172.16.0.1

#db
export db=enp0s3
export db_ip=172.16.0.2

# flush rules
${ipt} -F

# drop all unwanted traffic
${ipt} -P INPUT DROP
${ipt} -P OUTPUT DROP
${ipt} -P FORWARD DROP

# allow all trafic at loopback interface
${ipt} -A INPUT -i lo -j ACCEPT
${ipt} -A OUTPUT -o lo -j ACCEPT

# allow ping
${ipt} -A INPUT -p icmp -j ACCEPT
${ipt} -A OUTPUT -p icmp -j ACCEPT
${ipt} -A FORWARD -p icmp -j ACCEPT

# allow established connections
${ipt} -A INPUT -p all -m state --state ESTABLISHED,RELATED -j ACCEPT
${ipt} -A OUTPUT -p all -m state --state ESTABLISHED,RELATED -j ACCEPT
${ipt} -A FORWARD -p all -m state --state ESTABLISHED,RELATED -j ACCEPT

# defence from some network attacks
# block packets without status
${ipt} -A INPUT -m state --state INVALID -j DROP
${ipt} -A FORWARD -m state --state INVALID -j DROP

# block for null packets
${ipt} -A INPUT -p tcp --tcp-flags ALL NONE -j DROP

# block syn-flood attacks
${ipt} -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
${ipt} -A OUTPUT -p tcp ! --syn -m state --state NEW -j DROP

# allow ssh
${ipt} -A INPUT -d ${rou2web_ip} -p tcp --dport 22 -j ACCEPT
${ipt} -A INPUT -d ${rou2db_ip} -p tcp --dport 22 -j ACCEPT
${ipt} -A OUTPUT -o ${rou2web} -p tcp --dport 22 -j ACCEPT
${ipt} -A OUTPUT -o ${rou2db} -p tcp --dport 22 -j ACCEPT
${ipt} -A FORWARD -i ${rou2web} -p tcp --dport 22 -j ACCEPT
${ipt} -A FORWARD -i ${rou2db} -p tcp --dport 22 -j ACCEPT

# allow dns
${ipt} -A INPUT -d ${rou2db_ip} -p tcp --dport 53 -j ACCEPT
${ipt} -A INPUT -d ${rou2db_ip} -p udp --dport 53 -j ACCEPT
${ipt} -A INPUT -d ${rou2web_ip} -p tcp --dport 53 -j ACCEPT
${ipt} -A INPUT -d ${rou2web_ip} -p udp --dport 53 -j ACCEPT

# allow grafana from web
${ipt} -A INPUT -s ${web_ip} -p tcp --dport 3000 -j ACCEPT

# allow http and https from everywhere
${ipt} -A FORWARD -d ${web_ip} -p tcp -m multiport --dports 80,443 -j ACCEPT
# allow 8010/tcp for pgAdmin4
${ipt} -A FORWARD -d ${web_ip} -p tcp --dport 8010 -j ACCEPT
# and to web from router
${ipt} -A OUTPUT -d ${web_ip} -p tcp -m multiport --dports 80,443 -j ACCEPT
${ipt} -A OUTPUT -d ${web_ip} -p tcp --dport 8010 -j ACCEPT

# allow postgres
${ipt} -A FORWARD -d ${db_ip} -p tcp --dport 5432 -j ACCEPT

# allow connect to node-exporter on web

${ipt} -A OUTPUT -d ${web_ip} -p tcp --dport 9100 -j ACCEPT

# all logged packets visible at /var/log/messages
${ipt} -N block_in
${ipt} -N block_out
${ipt} -N block_fwd

${ipt} -A INPUT -j block_in
${ipt} -A OUTPUT -j block_out
${ipt} -A FORWARD -j block_fwd

${ipt} -A block_in -j LOG --log-level info --log-prefix "--IN--BLOCK"
${ipt} -A block_in -j DROP
${ipt} -A block_out -j LOG --log-level info --log-prefix "--OUT--BLOCK"
${ipt} -A block_out -j DROP
${ipt} -A block_fwd -j LOG --log-level info --log-prefix "--FWD--BLOCK"
${ipt} -A block_fwd -j DROP
