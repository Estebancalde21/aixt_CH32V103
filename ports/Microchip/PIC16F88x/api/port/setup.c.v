// Project Name: Aixt project, https://github.com/fermarsan/aixt.git
// Author: Luis Alfredo Pinto Medina and Fernando M. Santa
// Date: 2024
// License: MIT
//
// Description: Pin-port functions (PIC16F886 port)
module port

@[inline]
pub fn setup(PORT_NAME, VALUE) {
	C.TRIS ## PORT_NAME = VALUE
}