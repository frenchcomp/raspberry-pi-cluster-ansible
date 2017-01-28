#
# Shorewall version 4.0 - Sample Interfaces File for two-interface configuration.
# Copyright (C) 2006-2014 by the Shorewall Team
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# See the file README.txt for further details.
#------------------------------------------------------------------------------
# For information about entries in this file, type "man shorewall-interfaces"
###############################################################################
?FORMAT 2
###############################################################################
#ZONE	INTERFACE	OPTIONS
net     eth0        dhcp,tcpflags,nosmurfs,routefilter,logmartians,sourceroute=0
net     wlan0		dhcp,tcpflags,nosmurfs,routefilter,logmartians,sourceroute=0
loc     br0         tcpflags,nosmurfs,routefilter,logmartians
loc     ethpi+		tcpflags,nosmurfs,routefilter,logmartians
loc     docker0		tcpflags,nosmurfs,routefilter,logmartians

