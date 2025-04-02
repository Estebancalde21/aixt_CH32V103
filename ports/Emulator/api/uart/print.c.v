// Project name: Aixt, https://github.com/fermarsan/aixt.git
// Author: Fernando M. Santa
// Date: 2023-2024
// License: MIT
module uart

pub fn print(msg string) {
	C.printf('\033[1;32m')	// green
    C.printf('%s', msg)
}