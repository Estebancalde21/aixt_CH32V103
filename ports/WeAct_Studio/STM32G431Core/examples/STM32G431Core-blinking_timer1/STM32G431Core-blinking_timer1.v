// Project name: On-board LED blinking
// Author:	Fernando M. Santa & Santiago Farfán
// Date:	09/05/2025
// STM32G431Core board

import timer1
import pin

__global (
	state = true
)

// interrupt service routine for timer1 overload
@[timer1_isr]
fn blinking() {
	timer1.restart()
	state = !state
}

pin.setup(led_0, pin.output)
pin.low(led_0) // reset LED pin
timer1.setup(1, timer1.hz)
timer1.irq_enable()	// enables timer1 interrupt

for {
	// empty infinite loop
}