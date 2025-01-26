# Makefile for HC908QT2 PWM program using SDCC-M08

# Target microcontroller
TARGET = m08

# Output file names
OUTPUT = pwm_output
HEX = $(OUTPUT).hex
REL = $(OUTPUT).rel

# Source files
SRC = main.c

# Compiler and flags
CC = sdcc
CFLAGS = -m$(TARGET) --std-sdcc11 --opt-code-size
LDFLAGS = -m$(TARGET) --out-fmt-ihx

# Default target
all: $(HEX)

# Compile the source code into a relocatable object file
$(REL): $(SRC)
	$(CC) $(CFLAGS) -c $< -o $@

# Link the object file into a HEX file
$(HEX): $(REL)
	$(CC) $(LDFLAGS) $< -o $@

# Clean up build files
clean:
	rm -f *.asm *.lst *.mem *.map *.lk *.rel *.rst *.sym *.ihx *.hex *.adb *.cdb

# Flash the HEX file to the microcontroller (replace with your programmer command)
flash:
	programmer-cli -f $(HEX)  # Replace with your actual flashing command

# Phony targets
.PHONY: all clean flash
