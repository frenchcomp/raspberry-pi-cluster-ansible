#
# Sample configuration file for ISC dhcpd for Debian
#
#

# The ddns-updates-style parameter controls whether or not the server will
# attempt to do a DNS update when a lease is confirmed. We default to the
# behavior of the version 2 packages ('none', since DHCP v2 didn't
# have support for DDNS.)
ddns-update-style none;

# option definitions common to all supported networks...
option domain-name "example.org";
option domain-name-servers ns1.example.org, ns2.example.org;

default-lease-time 600;
max-lease-time 7200;

# If this DHCP server is the official DHCP server for the local
# network, the authoritative directive should be uncommented.
authoritative;

# Use this to send dhcp log messages to a different log file (you also
# have to hack syslog.conf to complete the redirection).
log-facility local7;

# No service will be given on this subnet, but declaring it helps the
# DHCP server to understand the network topology.

subnet 192.168.142.0 netmask 255.255.255.0 {
  range 192.168.142.10 192.168.142.20;
  option broadcast-address 192.168.142.255;
  option routers 192.168.142.1;
  default-lease-time 600;
  max-lease-time 7200;
  option domain-name "labs.teknoo.software";
  option domain-name-servers 8.8.8.8;
}

host pi1 {
  hardware ethernet 00:22:82:ff:ff:01;
  fixed-address 192.168.142.11;
}

host pi2 {
  hardware ethernet 00:22:82:ff:ff:02;
  fixed-address 192.168.142.12;
}

host pi3 {
  hardware ethernet 00:22:82:ff:ff:03;
  fixed-address 192.168.142.13;
}

host pi4 {
  hardware ethernet 00:22:82:ff:ff:04;
  fixed-address 192.168.142.14;
}
