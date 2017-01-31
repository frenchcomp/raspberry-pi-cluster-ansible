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
option domain-name "{{network.domain}}";
option domain-name-servers {{network.dns}};

default-lease-time {{dhcp_server.time_lease}};
max-lease-time {{dhcp_server.max_lease_time}};

# If this DHCP server is the official DHCP server for the local
# network, the authoritative directive should be uncommented.
authoritative;

# Use this to send dhcp log messages to a different log file (you also
# have to hack syslog.conf to complete the redirection).
log-facility local7;

# No service will be given on this subnet, but declaring it helps the
# DHCP server to understand the network topology.

subnet {{network.network_address}} netmask {{network.netmask}} {
  range {{dhcp_server.range_start}} {{dhcp_server.range_end}};
  option broadcast-address  {{network.broadcast}};
  option routers {{network.host_address}};
  default-lease-time {{dhcp_server.time_lease}};
  max-lease-time {{dhcp_server.max_lease_time}};
  option domain-name "{{network.domain}}";
  option domain-name-servers {{network.dns}};
}

{% if dhcp_server.static_map is defined %}
  {% for staticLease in dhcp_server.static_map %}
  host {{ staticLease.name }} {
    hardware ethernet {{ staticLease.mac }};
    fixed-address {{staticLease.address}};
  }
  {% endfor %}
{% endif %}