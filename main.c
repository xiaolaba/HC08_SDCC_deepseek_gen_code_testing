//#include <hc908qt2.h>  // Include the HC908QT2 register definitions

#include <mc68hc908qy.h>  // include file for SDCC, xiaolaba 2025-JAN-26


// Define register addresses for TIM (Timer Interface Module)
#define TSC  *(volatile unsigned char *)0x20  // Timer Status and Control Register
#define TMOD *(volatile unsigned char *)0x21  // Timer Modulo Register (8-bit)
#define TCH0 *(volatile unsigned char *)0x22  // Timer Compare Register for Channel 0 (PB0)
#define TCH1 *(volatile unsigned char *)0x23  // Timer Compare Register for Channel 1 (PB1)
#define DDRB *(volatile unsigned char *)0x04  // Data Direction Register for Port B

// Function to initialize PWM on PB0 and PB1
void PWM_Init(void) {
    // Set PB0 and PB1 as output for PWM
    DDRB |= (1 << 0) | (1 << 1);  // PB0 and PB1 as output

    // Configure TIM for PWM mode
    TSC = 0x00;          // Stop the timer
    TMOD = 0x50;         // Set TIM period to 80 cycles (for 100 kHz at 8 MHz bus clock)
    TCH0 = 0x28;         // Set duty cycle for PB0 (50% duty cycle: 40 cycles)
    TCH1 = 0x28;         // Set duty cycle for PB1 (50% duty cycle: 40 cycles)

    // Enable TIM and start PWM
    TSC = 0x0C;          // Enable TIM with no prescaler (bus clock / 1)
}

// Main function
void main(void) {
    PWM_Init();  // Initialize PWM

    while (1) {
        // Main loop
        // You can adjust the duty cycle dynamically if needed
    }
}
