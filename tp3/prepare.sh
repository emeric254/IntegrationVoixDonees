#!/bin/bash

apt-get update

apt-get install asterisk
apt-get install asterisk-prompt-fr-proformatique

# sip phone(s)
#apt-get install twinkle
#apt-get install ekiga
#apt-get install linphone


killall dhclient

ip a f dev eth0
ip r f dev eth0

ip a a 1.1.0.1/16 dev eth0
