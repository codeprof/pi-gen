sudo /bin/rm -v /etc/ssh/ssh_host_*
sudo dpkg-reconfigure openssh-server
sudo apt-get install unattended-upgrades
sudo apt-get install selinux-basics selinux-policy-default
sudo selinux-activate
sudo setenforce 1
sudo systemctl disable avahi-daemon
apt purge gcc-* gdb