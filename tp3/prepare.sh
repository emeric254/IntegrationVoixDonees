#!/bin/bash

# update pkg list
apt-get update
# asterisk server
apt-get install asterisk
# lang fr
apt-get install asterisk-prompt-fr-proformatique

# sip phone(s) :
#apt-get install twinkle
#apt-get install ekiga
#apt-get install linphone

# -----------------------------------------------
# static ip conf
killall dhclient
# flush addrs / rts
ip a f dev eth0
ip r f dev eth0
# our lan :
ip a a 1.1.0.1/16 dev eth0
# interco with lan 2 :
ip a a 1.2.0.254/16 dev eth0
# etc ...
#ip a a 1.3.0.254/16 dev eth0
