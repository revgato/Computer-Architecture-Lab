#Laboratory Exercise 4, Home Assignment 2c
# Set LSB of $s0 (bits 7 to 0 are set to 1)
.text
li $s0, 0x20194484 #load test value for these function
ori $s0, $s0, 0x000000ff # Set LSB of $s0 (bits 7 to 0 are set to 1)
