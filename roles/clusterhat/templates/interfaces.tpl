# interfaces(5) file used by ifup(8) and ifdown(8)

# Include files from /etc/network/interfaces.d:
source-directory /etc/network/interfaces.d

auto lo br0
iface lo inet loopback

allow-hotplug wlan0
iface wlan0 inet dhcp
    wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf

allow-hotplug eth0
iface eth0 inet dhcp

iface br0 inet static
        bridge_ports none
        bridge_stp off
        bridge_waitport 0
        bridge_fd 0
	    address {{network.host_address}}
	    broadcast {{network.broadcast}}
	    netmask {{network.netmask}}
