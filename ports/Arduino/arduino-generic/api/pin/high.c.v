// Project Name: Aixt, https://github.com/fermarsan/aixt.git
// Author: Fernando M. Santa
// Date: 2024
// License: MIT
module pin

// high puts a high value (logic 1) to a specific pin
@[inline]
pub fn high(name u8) {   
    C.digitalWrite(name, C.HIGH)
}