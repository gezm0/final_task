#!/usr/bin/bash

tc=/usr/sbin/tc
iface=enp0s8

${tc} qdisc del root dev ${iface}
