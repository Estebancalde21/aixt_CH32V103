// Project Name: Aixt, https://github.com/fermarsan/aixt.git
// Author: Fernando M. Santa
// Date: 2024
// License: MIT
module pin

// toggle macro sets an output pin. This is expanded in this way:
//   pin.toggle(pin.b2)
//     |
//	   +-->	pin.toggle(pin.B, 2)
//	          |
//	          +-->	PORTBbits.PORTB2 ^= 1	// PIC16	
// 	          		LATBbits.LATB2 ^= 1		// (PIC18, PIC24, dsPIC33)
@[inline]
pub fn toggle_(PORT_NAME, PIN) {
	C.LAT ## PORT_NAME ## bits.LAT ## PORT_NAME ## PIN ^= 1
}

@[inline]
pub fn toggle(PIN_NAME) {
	C.pin.toggle_(PIN_NAME)
}



