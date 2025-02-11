// Project name: Aixt https://github.com/fermarsan/aixt.git
// Authors:
//	 - Julian Camilo Guzmán Zambrano
//	 - Juan Pablo Gonzalez Penagos
//	 - Fernando M. Santa
// Date: 2022-2024
// License: MIT
//
// // Description: LOW functions (Blue Pill_STM32F103C)
//              (PC port) 

module pin

@[inline]
pub fn low(PIN_NAME) {
	C.digitalWrite(PIN_NAME, LOW)
}