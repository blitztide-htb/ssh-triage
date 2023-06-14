hostname
date
echo "===Uname -a==="
uname -a
dmesg
echo "===User activity==="
last
who
echo "===Disk info==="
mount
lsblk
df -h
echo "===Passwd/shadow==="
cat /etc/passwd
cat /etc/shadow
echo "===Networking==="
ifconfig -a || ip add
netstat -r
echo "===Services==="
systemctl -a
echo "===Logfiles==="
journalctl -a
find /var/log
echo "===HISTORIES==="
find /home -name '*_history' -exec cat {} \;
