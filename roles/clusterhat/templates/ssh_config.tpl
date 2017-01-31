Host host.ssh
    Hostname 192.168.142.1
    User pi
    IdentitiesOnly yes

{% if dhcp_server.static_map is defined %}
{% for staticLease in dhcp_server.static_map %}
Host pi{{loop.index}}.ssh
    Hostname {{staticLease.address}}
    User pi
    IdentitiesOnly yes

{% endfor %}
{% endif %}