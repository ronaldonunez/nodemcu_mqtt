m = mqtt.Client("clientid", 120, "", "")

--[[m:on("connect", function(client) 
	m:publish("paho/test/single/hello","--> hello esp",0,0, function(m) print("sent") end)
end)]]
--m:on("connect", function(client) print ("Connected to broker") end)
m:on("offline", function(client) print ("offline") end)

m:connect("iot.eclipse.org", 1883, 0, 1, 
	function(client)
		m:publish("paho/test/single/hello","--> hello esp",0,0, 
			function(m) 
				print("published!") 
			end)
	end)

