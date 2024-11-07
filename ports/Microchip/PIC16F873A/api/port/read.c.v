// Project Name: Aixt, https://github.com/fermarsan/aixt.git
// Author: Cesar Alejandro Roa Acosta and Fernando M. Santa
// Date: 2024
// License: MIT
//
// Description: Port management functions
//              (PIC16F87x port)

module port

@[inline]
pub fn read(PORT_NAME) {
C.PORT ## PORT_NAME
}