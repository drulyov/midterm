#! /bin/bash

export MY_NETWORK_NO=27
export OTHER_NETWORKS="1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29"


X=${MY_NETWORK_NO}
Y=${OTHER_NETWORKS}
echo "Your Network Number is $X"

# Add new route
for y in $Y
do
	if [ "$X" -ne "$y" ]
	then
	    sudo route add -net 192.168.${y}.0 netmask 255.255.255.0 gw 192.168.${X}.1
	    sudo route add -net 172.16.${y}.1 netmask 255.255.255.255 gw 192.168.${X}.1
	    echo "Adding route to 192.168.${y}.0 network via 192.168.${X}.1"
	    echo "Adding route to 172.16.${y}.1 network via 192.168.${X}.1"

	fi
done

# Add route to the 172.16.0.0 network
#route add -net 172.16.0.0 netmask 255.255.0.0 gw 192.168.${X}.1
