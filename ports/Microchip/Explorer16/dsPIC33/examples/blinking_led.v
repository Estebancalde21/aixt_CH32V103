/* Blinking LED on the Explorer16 board with 
a dsPIC33 microcontroller (XC16 compiler)*/

for {   //infinite loop
    pin.high(led10)     // LED 10 blinking
    sleep_ms(500)
    pin.low(led10)
    sleep_ms(500)
}