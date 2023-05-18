#!/bin/sh

# Fetch the public IP address from an external API
public_ip=$(curl -s https://api.ipify.org)
public_ip_1=$(curl -H Metadata:true "http://169.254.169.254/metadata/instance/network/interface/0/ipv4/ipAddress/0/publicIpAddress?api-version=2017-08-01&format=text")
public_ip_2=$(curl ifconfig.me)

# Set the public IP address as an environment variable
# export FREESWITCH_PUBLIC_IP=$public_ip
export AIDA_1="http://$AIDA_HOST:8085"

echo "$public_ip" > test_ip.txt
echo "$public_ip_1" >> test_ip.txt
echo "$public_ip_2" >> test_ip.txt
echo "$AIDA_1" >> test_ip.txt

freeswitch -nonat -conf /usr/local/freeswitch/conf -log /usr/local/freeswitch/log -db /usr/local/freeswitch/db -scripts /usr/local/freeswitch/scripts -storage /usr/local/freeswitch/store
