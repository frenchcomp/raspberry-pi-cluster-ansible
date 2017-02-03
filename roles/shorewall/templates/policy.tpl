#
# Shorewall version 4.0 - Sample Policy File for two-interface configuration.
# Copyright (C) 2006-2014 by the Shorewall Team
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# See the file README.txt for further details.
#------------------------------------------------------------------------------
# For information about entries in this file, type "man shorewall-policy"
###############################################################################
#SOURCE		DEST		POLICY		LOG LEVEL	LIMIT:BURST

loc		net		ACCEPT
loc     $FW     ACCEPT
$FW		net		ACCEPT
$FW		loc		ACCEPT
net		all		DROP		info
# THE FOLLOWING POLICY MUST BE LAST
all		all		REJECT		info

