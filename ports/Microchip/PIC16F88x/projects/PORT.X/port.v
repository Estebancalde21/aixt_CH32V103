import port
import time {sleep_ms}

port.setup(port.b, 0b00000000)

for{

	port.write(port.b,0b01010101)
	sleep_ms(500)
	port.write(port.b,0b10101010)
	sleep_ms(500)
}