// Project name: Aixt, https://github.com/fermarsan/aixt.git
// Author: Fabián A. Rojas Acosta, Alberto Pinzón Valero and Fernando M. Santa
// Date: 2024
// License: MIT
module pin

// setup configures a pin's input/output mode
@[inline]
pub fn setup(PIN_NAME, MODE) {
	C.pinMode(PIN_NAME, MODE)
}