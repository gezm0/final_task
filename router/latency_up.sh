#!/usr/bin/bash

tc=/usr/sbin/tc
iface=enp0s8

# add 75ms to delays with +15ms variation
${tc} qdisc add dev ${iface} root netem delay 75ms 15ms

# add 10mbit shape with 512kbit burst, drop packets with more than 500ms latency
#${tc} qdisc add dev ${iface} root tbf rate 10mbit burst 512kbit latency 500ms

