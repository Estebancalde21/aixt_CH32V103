// Project name: Aixt, https://github.com/fermarsan/aixt.git
// Author: Fabián A. Rojas Acosta, Alberto Pinzón Valero and Fernando M. Santa
// Date: 2024
// License: MIT
module uart

// Reads incoming serial data
@[inline]
pub fn read() {
	C.Serial.read()
}