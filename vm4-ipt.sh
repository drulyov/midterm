iptables -I INPUT -p tcp -s 192.168.27.0/24 --dport 22 -j ACCEPT
iptables -I INPUT -p tcp -s 172.16.0.1 --dport 22 -j ACCEPT

iptables -A INPUT -p udp --dport 53 -j ACCEPT

iptables -A INPUT -p udp -s 192.168.27.0/24 -d 192.168.27.51/32 --dport 514 -j ACCEPT

iptables -A INPUT -p icmp -j ACCEPT

iptables -A INPUT -i lo -j ACCEPT
iptables -I INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j LOG --log-prefix "External SSH Traffic: " --log-level 4

iptables -A INPUT -p tcp --dport 22 -j REJECT

iptables -A INPUT -p udp -j LOG --log-prefix "Other UDP Traffic: " --log-level 4

iptables -A INPUT -j LOG --log-prefix "OTHER Traffic: " --log-level 4
