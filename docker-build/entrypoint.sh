#!/bin/sh

# Fetch the public IP address from an external API
public_ip=$(curl -s https://api.ipify.org)

# Set the public IP address as an environment variable
export FREESWITCH_PUBLIC_IP=$public_ip

freeswitch -nonat -conf /usr/local/freeswitch/conf -log /usr/local/freeswitch/log -db /usr/local/freeswitch/db -scripts /usr/local/freeswitch/scripts -storage /usr/local/freeswitch/store
