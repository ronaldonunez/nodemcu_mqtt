dofile("net_credentials.lua")
wifi.setmode(wifi.STATION)
wifi.sta.config(network.ssid, network.passwd)