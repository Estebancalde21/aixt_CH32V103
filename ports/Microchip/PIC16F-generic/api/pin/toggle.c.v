// Project Name: Aixt project, https://github.com/fermarsan/aixt.git
// Author: Fernando M. Santa
// Date: 2024
// License: MIT
//
// Description: Pin management functions for 16F family
module pin

// toggle function toggles the logic value of a pin
@[inline]
pub fn toggle(name u8) {
	unsafe {
		*(&C.PORTA + (name >> 3))  ^=  0x01 << (name - ((name >> 3) << 3))
	}// *(&C.PORTA + (name / 8))   ^=  0x01 << (name % 8)
}
