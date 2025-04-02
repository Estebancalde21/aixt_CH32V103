// Project Name : Aixt: http://github.com/fermansan/aixt.git
// Authors:
//  - Arley Junco
//  - Luis Quevedo
//  - Fernando M. Santa
// Date: 2024
// License : MIT

module pin 

@[inline]
pub fn read(PIN_NAME) {
	C.digitalRead(PIN_NAME)
}