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
option domain-name "{{local_network.domain}}";
option domain-name-servers {{local_network.dns}};

default-lease-time {{local_network.time_lease}};
max-lease-time {{local_network.max_lease_time}};

# If this DHCP server is the official DHCP server for the local
# network, the authoritative directive should be uncommented.
authoritative;

# Use this to send dhcp log messages to a different log file (you also
# have to hack syslog.conf to complete the redirection).
log-facility local7;

# No service will be given on this subnet, but declaring it helps the
# DHCP server to understand the network topology.

subnet {{local_network.base_address}}.0 netmask {{local_network.netmask}} {
  range {{local_network.base_address}}.10 {{local_network.base_address}}.30;
  option broadcast-address  {{local_network.broadcast}};
  option routers {{local_network.address}};
  default-lease-time {{local_network.time_lease}};
  max-lease-time {{local_network.max_lease_time}};
  option domain-name "{{local_network.domain}}";
  option domain-name-servers {{local_network.dns}};
}

host pi1 {
  hardware ethernet {{local_network.hardware_mac}}:01;
  fixed-address {{local_network.base_address}}.11;
}

host pi2 {
  hardware ethernet {{local_network.hardware_mac}}:02;
  fixed-address {{local_network.base_address}}.12;
}

host pi3 {
  hardware ethernet {{local_network.hardware_mac}}:03;
  fixed-address {{local_network.base_address}}.13;
}

host pi4 {
  hardware ethernet {{local_network.hardware_mac}}:04;
  fixed-address {{local_network.base_address}}.14;
}

host pi5 {
  hardware ethernet {{local_network.hardware_mac}}:05;
  fixed-address {{local_network.base_address}}.15;
}

host pi6 {
  hardware ethernet {{local_network.hardware_mac}}:06;
  fixed-address {{local_network.base_address}}.16;
}

host pi7 {
  hardware ethernet {{local_network.hardware_mac}}:07;
  fixed-address {{local_network.base_address}}.17;
}

host pi8 {
  hardware ethernet {{local_network.hardware_mac}}:08;
  fixed-address {{local_network.base_address}}.18;
}

host pi9 {
  hardware ethernet {{local_network.hardware_mac}}:09;
  fixed-address {{local_network.base_address}}.19;
}
