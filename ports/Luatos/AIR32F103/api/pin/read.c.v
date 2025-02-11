// Project name: Aixt https://github.com/fermarsan/aixt.git
// Authors:
//	 - Julian Camilo Guzmán Zambrano
//	 - Juan Pablo Gonzalez Penagos
//	 - Fernando M. Santa
// Date: 2022-2024
// License: MIT
//
// // Description: READ functions (Blue Pill_STM32F103C)
//              (PC port) 

module pin

@[inline]
pub fn read(PIN_NAME) {
	C.digitalRead(PIN_NAME)
}