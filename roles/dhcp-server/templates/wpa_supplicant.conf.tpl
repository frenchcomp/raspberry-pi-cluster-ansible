country={{wpa_supplicant.country}}
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

{% if wpa_supplicant.networks is defined %}
  {% for wifiNetwork in wpa_supplicant.networks %}
  network={
    ssid="{{wifiNetwork.ssid}}"
    psk="{{wifiNetwork.psk}}"
  }
  {% endfor %}
{% endif %}