// Project name: Aixt, https://github.com/fermarsan/aixt.git
// Author: Cristian Garzón
// Date: 2023 - 2024
// Description: UART3 functions (WCH-CH573F)

module uart3

@[inline]
pub fn uart3.println(MSG) {
C.uart3.print(MSG);  uart3.write('\n');  uart3.write('\r')
}