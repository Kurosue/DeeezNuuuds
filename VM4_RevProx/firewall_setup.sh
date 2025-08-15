#!/bin/bash
ufw --force reset
ufw default deny incoming
ufw default allow outgoing
ufw allow 80/tcp
ufw allow out to 192.168.56.20 port 8080 proto tcp
ufw allow from 192.168.56.0/24 proto icmp
ufw deny from 192.168.56.60
ufw --force enable

