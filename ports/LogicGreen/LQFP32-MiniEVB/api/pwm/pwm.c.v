// Project name: Aixt, https://github.com/fermarsan/aixt.git
// Author: Fabián A. Rojas Acosta, Alberto Pinzón Valero and Fernando M. Santa
// Date: 2024
// License: MIT
//
// Description: PWM functions (LQFP32 MiniEVB Nano - LGT8F328P port)
module pwm

//Writes an analog value (PWM wave) to a pin
@[inline]
pub fn write(PIN_NAME, VALUE) {
	C.analogWrite(PIN_NAME, VALUE)
}

