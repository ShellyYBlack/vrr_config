#!/bin/bash
apt update &&
apt upgrade &&
# Install software
apt-get install xrdp-pulseaudio-installer vlc darktable &&
# Create a central location to store materials
mkdir /home/VRR &&
# Make a symlink to that will automatically appear on user’s desktop when they log in
ln -s /home/VRR /etc/skel/Desktop/VirtualReadingRoom &
# Edit firewall rules to disable HTTPS traffic
iptables -A OUTPUT -p tcp -m owner --uid-owner $(whoami) -j ACCEPT &
iptables -A OUTPUT -p tcp --dport 443 -j DROP &
iptables -A OUTPUT -p tcp --dport 80  -j DROP &
# Create a firewall rule to change the SSH port number
iptables -I INPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT &
# Make the firewall rules persist after rebooting
/sbin/iptables-save &
# Prevent others from connecting to server via SSH
echo -e "AllowUsers $(whoami)\nPort 22\nAllowTcpForwarding no" | tee -a /etc/ssh/ssh_config &
systemctl restart ext_sshd &
# Prevent others from connecting from server via SSH
chmod o= /usr/bin/ssh &
groupadd sshusers &
chgrp sshusers /usr/bin/ssh &
usermod -a -G sshusers $(whoami) &
# Disable researchers from accessing local drives from VRR
# If copying and pasting should be disabled, also set cliprdr to false
sed -i 's/rdpdr=true/rdpdr=false/g' /etc/xrdp/xrdp.ini &
systemctl restart xrdp &
# Make a directory with researcher initials as its name
mkdir /home/VRR/ABC &&
chgrp -R sshusers /home/VRR/ABC &
chmod -R 570 /home/VRR/ABC &
# Make the researcher account the directory owner
chown -R researcherID /home/VRR/ABC &
cd /home/VRR/ABC &
mkdir EADID DuplicationRequests &&
chmod -R 770 DuplicationRequests
# Install xRDP and enable sound redirection
cd ~/Downloads &&
wget https://www.c-nergy.be/downloads/xRDP/xrdp-installer-1.4.6.zip &&
unzip xrdp-installer-1.4.6.zip &&
chmod +x  ~/Downloads/xrdp-installer-1.4.6.sh &&
./xrdp-installer-1.4.6.sh -s &&
reboot
