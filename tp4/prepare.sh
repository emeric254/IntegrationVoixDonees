#!/bin/bash
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )

echo "PKG"
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
echo "IP"
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

# activate ipv4 forward
sysctl net.ipv4.ip_forward=1

# -----------------------------------------------
echo "CONF"
# asterisk conf
# stop daemon
systemctl asterisk stop
# copy our conf files
cp $SCRIPTPATH/conf/extensions.conf /etc/asterisk/
cp $SCRIPTPATH/conf/sip.conf /etc/asterisk/
cp $SCRIPTPATH/conf/voicemail.conf /etc/asterisk/
# start deamon
systemctl asterisk start

# -----------------------------------------------
echo "CLI"
# wait some time
sleep 3
# launch asterisk interactive cli attached to the daemon
asterisk -rvvv
