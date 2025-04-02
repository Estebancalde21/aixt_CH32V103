// Project Name: Aixt, https://github.com/fermarsan/aixt.git
// Authors:
//        - Juan Pablo Bernal
//        - Daniela Mendoza Deantonio
//        - Fernando M. Santa
// SPI


// Functions for the SPI communication module library

module spi

// Habilita el uso de interrupciones en el bus SPI.
@[as_macro]
pub fn using_irq(interrupt_num u8) {  
    C.SPI_USINGINTERRUPT(interrupt_num)
}