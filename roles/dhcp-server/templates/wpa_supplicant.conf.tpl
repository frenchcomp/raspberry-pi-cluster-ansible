country={{wpa_supplicant.country}}
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
  ssid="{{wpa_supplicant.network1}}"
  psk="{{wpa_supplicant.psk1}}"
}

network={
  ssid="{{wpa_supplicant.network2}}"
  psk="{{wpa_supplicant.psk2}}"
}
