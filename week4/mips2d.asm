#Laboratory Exercise 4, Home Assignment 2d
# Clear $s0 (s0=0, must use logical instructions)
.text
li $s0, 0x20194484 #load test value for these function
andi $s0, $s0, 0x00000000 # Clear $s0
