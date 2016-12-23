dofile("gpio_config.lua")

m = mqtt.Client("clientid", 120, "", "")

m:on("connect", 
	function(client) 
		print ("Connected to broker")
		gpio.write(led, gpio.LOW)
		m:subscribe("home/living/light",0,
		function(conn)
			print("Sucessfully subscribed!")
		end) 
	end)

m:on("offline", function(client) print ("offline") end)

m:on("message", 
	function(conn, topic, data) 
		if data ~= nil then
    		print(data)
    		if relay_state == false then
    			relay_state = true
    			gpio.write(relay, gpio.LOW)
    		else
    			relay_state = false
    			gpio.write(relay, gpio.HIGH)
    		end
  		end
	end)

m:connect("iot.eclipse.org", 1883, 0, 1)