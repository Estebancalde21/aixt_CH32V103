// Project name: Aixt https://github.com/fermarsan/aixt.git
// Authors:
//	 - Julian Camilo Guzmán Zambrano
//	 - Juan Pablo Gonzalez Penagos
//	 - Fernando M. Santa
// Date: 2022-2024
// License: MIT
//
// // Description: READ_1 functions (STM32F103C)
//              (PC port) 

module uart

@[inline]
pub fn read_1() {
	C.Serial1.read()
}
