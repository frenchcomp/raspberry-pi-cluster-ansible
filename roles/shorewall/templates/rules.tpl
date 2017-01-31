#
# Shorewall version 4.0 - Sample Rules File for two-interface configuration.
# Copyright (C) 2006-2014,2007 by the Shorewall Team
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# See the file README.txt for further details.
#------------------------------------------------------------------------------
# For information about entries in this file, type "man shorewall-rules"
######################################################################################################################################################################################################
#ACTION		SOURCE		DEST		PROTO	DEST	SOURCE		ORIGINAL	RATE		USER/	MARK	CONNLIMIT	TIME		HEADERS		SWITCH		HELPER
#							PORT	PORT(S)		DEST		LIMIT		GROUP
?SECTION ALL
?SECTION ESTABLISHED
?SECTION RELATED
?SECTION INVALID
?SECTION UNTRACKED
?SECTION NEW

#       Don't allow connection pickup from the net
#
Invalid(DROP)	net		all		tcp

#
#	Accept DNS connections from the firewall to the network
#
DNS(ACCEPT)	$FW		net
DNS(ACCEPT)	net		$FW

#
#	Accept SSH connections from the local network for administration
#
SSH(ACCEPT)	loc		$FW
SSH(ACCEPT)	net		$FW

#
#      Accept NFS from local
#
ACCEPT          $FW      loc             udp     111
ACCEPT          $FW      loc             udp     2049
ACCEPT          $FW      loc             udp     32764:32769
ACCEPT          loc      $FW             tcp     111
ACCEPT          loc      $FW             udp     111
ACCEPT          loc      $FW             tcp     2049
ACCEPT          loc      $FW             udp     2049
ACCEPT          loc      $FW             tcp     32764:32769
ACCEPT          loc      $FW             udp     32764:32769

#
#       Allow NTP
#
NTP(ACCEPT)	loc	 $FW

#
#       Allow docker
#
ACCEPT		loc	 $FW		 tcp 	 2377
ACCEPT		loc	 $FW		 udp	 2377

#
#	Allow Ping from the local network
#

Ping(ACCEPT)	loc		$FW
Ping(ACCEPT)	net		$FW

#
# Drop Ping from the "bad" net zone.. and prevent your log from being flooded..
#
ACCEPT		net		$FW		icmp
ACCEPT		$FW		loc		icmp
ACCEPT		$FW		net		icmp
#

#
# Forward SSH
#
{% if dhcp_server.static_map is defined %}
{% for staticLease in dhcp_server.static_map %}
DNAT        net     loc:{{staticLease.address}}:22    tcp    220{{loop.index}}
{% endfor %}
{% endif %}