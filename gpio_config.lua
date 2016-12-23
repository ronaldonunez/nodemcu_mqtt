relay = 1
relay_state = false
gpio.mode(relay,gpio.OUTPUT)
gpio.write(relay, gpio.HIGH)

led = 0
gpio.mode(led, gpio.OUTPUT)
gpio.write(led, gpio.HIGH)