// Project name: Aixt, https://github.com/fermarsan/aixt.git
// Author: Cristian Garzón
// Date: 2023 - 2024
// Description: ADC functions (WCH-CH582F)

module adc

@[inline]
pub fn setup(channel) {
C.ADC_ChannelCfg(channel)
}

