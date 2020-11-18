#! /bin/bash
export MY_NETWORK_NO=27
export OTHER_NETWORKS="1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 28 29 30"

if [ -z "$MY_NETWORK_NO" ]
then
	echo "Please run the following command to assign your network number" >&2
	echo "to the shell varible MY_NETWORK_NO and run this script again." >&2
	echo "Please replace xx with your actual network number." >&2
	echo "  export MY_NETWORK_NO=xx" >&2
	exit 1

fi
X=${MY_NETWORK_NO}
echo "Your Network Number is $X"
if [ -z "$OTHER_NETWORKS" ]
then
	echo "Please run the following command to assign the list of " >&2
	echo "private networks you want to add a route on your gateway " >&2
	echo "to the shell variable OTHER_NETWORKS and run this script again." >&2
	echo "The following command assign 32, 33, 34, 35, 40, 41, and 99" >&2
	echo "to the variable OTHER_NETWORKS. Please replace those number" >&2
	echo "with the ones you actually wanted." >&2
	echo "  export OTHER_NETWORKS=\"32 33 34 35 40 41 99\"" >&2
	exit 2

fi

Y=${OTHER_NETWORKS}

echo "Route to be add for the network number(s) $Y"
echo -n "Press ENTER to continue ... "
read dummy

# Add  new route
for y in $Y
do
	if [ "$X" -ne "$y" ]
	then
	    sudo route add -net 192.168.${y}.0 netmask 255.255.255.0 gw 172.16.${y}.1
	    echo "Adding route to 192.168.${y}.0 network." 
	fi
done

# enable IP forwarding on the gateway
echo "1" > /proc/sys/net/ipv4/ip_forward


