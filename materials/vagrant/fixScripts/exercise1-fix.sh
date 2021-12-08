#!/bin/bash
echo "installing net-too"
apt install -y net-tools
echo "deleting route"
route del -net 208.86.224.90 netmask 255.255.255.255 dev enp0s8