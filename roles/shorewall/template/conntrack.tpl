#
# Shorewall version 4 - conntrack File
#
# For information about entries in this file, type "man shorewall-conntrack"
#
##############################################################################################################
?FORMAT 3
#ACTION			SOURCE		DESTINATION	PROTO	DEST		SOURCE	USER/		SWITCH
#								PORT(S)		PORT(S)	GROUP
?if $AUTOHELPERS && __CT_TARGET

?if __AMANDA_HELPER
CT:helper:amanda:PO	-		-		udp	10080
?endif

?if __FTP_HELPER
CT:helper:ftp:PO	-		-		tcp	21
?endif

?if __H323_HELPER
CT:helper:RAS:PO	-		-		udp	1719
CT:helper:Q.931:PO	-		-		tcp	1720
?endif

?if __IRC_HELPER
CT:helper:irc:PO	-		-		tcp	6667
?endif

?if __NETBIOS_NS_HELPER
CT:helper:netbios-ns:PO	-		-		udp	137
?endif

?if __PPTP_HELPER
CT:helper:pptp:PO	-		-		tcp	1723
?endif

?if __SANE_HELPER
CT:helper:sane:PO	-		-		tcp	6566
?endif

?if __SIP_HELPER
CT:helper:sip:PO	-		-		udp	5060
?endif

?if __SNMP_HELPER
CT:helper:snmp:PO	-		-		udp	161
?endif

?if __TFTP_HELPER
CT:helper:tftp:PO	-		-		udp	69
?endif

?endif
